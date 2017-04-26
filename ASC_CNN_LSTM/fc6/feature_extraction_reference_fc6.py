import numpy as np
import os
from os.path import join
import argparse
import glob

import caffe

caffe.set_device(1)
caffe.set_mode_gpu()

from bcolors import bcolors

vgg_face_model = {
        'model_def':'/home/maxc01/project/python/nn_exercise/avec_classification/vgg_face_caffe/VGG_FACE_deploy.prototxt',
        'model_weights':'/home/maxc01/project/python/nn_exercise/avec_classification/vgg_face_caffe/VGG_FACE.caffemodel',
        'img_average': np.array([129.1863, 104.7624, 93.5940]),
        'n_output': 4096
        }
vgg_model = {
        'model_def':'/home/avec1/avec2016/caffe/models/vgg_16/VGG_ILSVRC_16_layers_deploy.prototxt',
        'model_weights':'/home/avec1/avec2016/caffe/models/vgg_16/VGG_ILSVRC_16_layers.caffemodel',
        'img_average': np.array([103.939 ,116.779 ,123.68]),
        'n_output':4096
        }
reference_model = {
        'model_def':'/home/avec1/avec2016/caffe/models/bvlc_reference_caffenet/deploy.prototxt',
        'model_weights':'/home/avec1/avec2016/caffe/models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel',
        'img_average': np.array([ 104.00698793,  116.66876762,  122.67891434]),
        'n_output': 4096
        }


def extract_feature_dir(model, dir_name, feature_path):
    '''
    args:
    dir_name: eg. dev_1_face, dev_2_face
    feature_path: feature store root path
    '''

    image_list = glob.glob(os.path.join(dir_name, "*.jpg"))
    image_list = sorted(image_list)

    dir_name = os.path.realpath(dir_name)
    base_dir_name = os.path.basename(dir_name)

    print bcolors.HEADER + 'starting processing video ' + \
            dir_name + bcolors.ENDC

    model_def = model['model_def']
    model_weights = model['model_weights']
    img_average = model['img_average']
    n_output = model['n_output']

    net = caffe.Net(model_def, model_weights, caffe.TEST)

    transformer = caffe.io.Transformer({'data': net.blobs['data'].data.shape})
    transformer.set_transpose('data', (2,0,1))
    transformer.set_mean('data', img_average)
    transformer.set_raw_scale('data', 255)
    transformer.set_channel_swap('data', (2,1,0))

    net.blobs['data'].reshape(1,3,227,227)

    output_features = np.zeros((len(image_list), n_output))
    for idx, image_name in enumerate(image_list):
        if idx % 100 == 0:
            print bcolors.OKGREEN + 'processed ' + str(idx) + bcolors.ENDC
        try:
            image = caffe.io.load_image(image_name)
        except:
            print '------', image_name, 'cannot be read'
            continue
        transformed_image = transformer.preprocess('data', image)
        net.blobs['data'].data[...] = transformed_image

        net.forward()

        output_features[idx] = net.blobs['fc6'].data

    np.save(join(feature_path, base_dir_name + "_feature"), output_features)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--dir_name", type=str,
            help='dir of face image')
    args = parser.parse_args()
    extract_feature_dir(reference_model, args.dir_name, "/home/avec1/avec2016/esc_feature/model_reference_fc6")

if __name__ == '__main__':
    main()
    # extract_feature(vgg_model, './avec2013_face_image_development/211_1_cut_combined_image_list', './avec2013_face_image_development_feature')
    # extract_feature(reference_model, './avec2013_face_image_development/211_1_cut_combined_image_list', './avec2013_face_image_development_feature')

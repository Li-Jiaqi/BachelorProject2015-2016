from keras.models import Sequential
from keras.layers import LSTM, Dense
from keras.utils import np_utils
import numpy as np

from six.moves import cPickle
import time

import os
import re

import data_loader


video_name_pattern = re.compile(r"(\d+_\d+)_")

data_dim = 150
timesteps = 24
stride = 12
nb_classes = 4


start_time = time.time()

model = Sequential()
model.add(LSTM(1024, input_shape=(timesteps, data_dim)))
model.add(Dense(nb_classes, activation='softmax'))

model.compile(loss='categorical_crossentropy', optimizer='rmsprop')


# load avec2013 data
feature_list_file = ''
with open(feature_list_file) as f:
    feature_list = f.read().splitlines()


train_label_mapping_file = ''
with open(train_label_mapping_file) as f:
    train_label_mapping = cPickle.load(f)

x_train = []
y_train = []
for f in feature_list:
    _x_train = data_loader.load_avec2013(f, timesteps, stride)

    feature_basename = os.path.basename(f)
    video_name = video_name_pattern.search(feature_basename).group(1)
    _y_train_label = train_label_mapping[video_name][1]
    _y_train = np.zeros(_x_train.shape[0])
    _y_train[...] = _y_train_label
    _y_train = np_utils.to_categorical(_y_train, nb_classes)

    x_train.append(_x_train)
    y_train.append(_y_train)

x_train = np.vstack(x_train)
y_train = np.vstack(y_train)


model.fit(x_train, y_train, batch_size=64, nb_epoch=5,
          show_accuracy=True)


# save model
print "saving model..."
json_string = model.to_json()
open('avec2013_model.json', 'w').write(json_string)
model.save_weights('avec2013_weights.h5')
print "saving done"

print "total time is", time.time() - start_time

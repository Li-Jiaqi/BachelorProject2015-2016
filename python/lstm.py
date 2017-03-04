from keras.models import Sequential
from keras.layers import LSTM,Dense
from keras.utils import np_utils
import numpy as np
# import re
# from six.moves import cPickle
import time
import os

batch_size= 5
'''
    reference :101
    vgg16 :113
    vggface :117
'''
data_dim = 101
timesteps = 10

model = Sequential()
model.add(  LSTM( 1, return_sequences=True, batch_input_shape=(None,timesteps, data_dim))  )
# model.add( LSTM(64, return_sequences=True) )
# model.add( LSTM(1, return_sequences=True) )
model.compile( optimizer='rmsprop',loss='mse')

x_train =[]
y_train = []
x_test = []
y_test = []
label_type = 'arousal'
# label_type = 'valence'
x_train_input = np.load('/home/avec1/avec2016/esc_feature/model_reference_fc7/total_feature_train_pca.npy')
y_train_input = np.load('/home/avec1/avec2016/arousal_valence_npy/total_'+label_type+'_train.npy')
x_train = x_train_input.reshape( (len(x_train_input)/timesteps,timesteps,data_dim) )
y_train = y_train_input.reshape( (len(y_train_input)/timesteps,timesteps,1) )

x_test_input = np.load('/home/avec1/avec2016/esc_feature/model_reference_fc7/total_feature_dev_pca.npy')
y_test_input =np.load('/home/avec1/avec2016/arousal_valence_npy/total_'+label_type+'_train.npy')
print "x_test_input.shape",x_test_input.shape
print label_type+"_test_input.shape",y_test_input.shape
x_test = x_test_input.reshape( (len(x_test_input)/timesteps,timesteps,data_dim) )
y_test = y_test_input.reshape( (len(y_test_input)/timesteps,timesteps,1) )
print "x_test.shape",x_test.shape
print label_type+"_test.shape",y_test.shape

print "train.shape:",x_train.shape
print "test.shape:",x_test.shape

model.fit(x_train,y_train, batch_size=batch_size, nb_epoch=5, validation_data=(x_test, y_test))
score = model.evaluate(x_test, y_test, batch_size = batch_size)
y_test_predict = model.predict(x_test, batch_size = batch_size)
y_test_predict = y_test_predict.reshape(7500,1)
np.savetxt(label_type+'_test_predict.txt',y_test_predict)
print 'Test score of '+label_type+': ' ,score

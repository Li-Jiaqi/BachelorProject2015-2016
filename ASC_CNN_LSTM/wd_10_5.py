import numpy as np
import os
time_length = 7500
def GetWindows(arr,window_size = 20, overlap = 10):
    # time_length = 7500
    # features = features[0:time_length]
    # labels = labels[0:time_length]
    nb_windows = ( time_length - window_size )/( window_size-overlap )
    arr_windows = []
    for num in xrange(0,nb_windows):
        time_start = num * overlap
        time_end   = time_start + window_size
        arr_windows.extend( arr[time_start:time_end] )
        # labels_windows.extend( labels[time_start:time_end] )
    return arr_windows



fea_TotalWindows = []
arousal_TotalWindows = []
valence_TotalWindows = []
fea = np.load('total_feature_train_pca.npy','r')
arousal = np.load('/home/avec1/avec2016/arousal_valence_npy/total_arousal_train.npy','r')
valence = np.load('/home/avec1/avec2016/arousal_valence_npy/total_valence_train.npy','r')
for i in xrange(1,10):
    time_start = (i-1) * time_length
    time_end = i*time_length - 1
    fea_TotalWindows.extend( GetWindows(fea[time_start:time_end+1],10,5) )
    arousal_TotalWindows.extend( GetWindows(arousal[time_start:time_end+1],10,5) )
    valence_TotalWindows.extend( GetWindows(valence[time_start:time_end+1],10,5) )
np.save("train_wd_10_5.npy",fea_TotalWindows)
np.save("arousal_wd_10_5.npy",arousal_TotalWindows)
np.save("valence_wd_10_5.npy",valence_TotalWindows)
print "fea_TotalWindows.shape",np.shape(fea_TotalWindows)
print "arousal_TotalWindows.shape",np.shape(arousal_TotalWindows)
print "valence_TotalWindows.shape",np.shape(valence_TotalWindows)

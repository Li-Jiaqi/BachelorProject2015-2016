import os
set_list = ['train', 'dev', 'test']
#set_list = ['test']
for setname in set_list:
    for i in range(1,10):
        print setname+"_"+str(i)
        #os.system("python feature_extraction_reference.py --dir_name  " +"/home/avec1/avec2016/facearea/"+setname+"_"+str(i)+"_face")
        os.system("python feature_extraction_vggface.py --dir_name  " +"/home/avec1/avec2016/facearea/"+setname+"_"+str(i)+"_face")

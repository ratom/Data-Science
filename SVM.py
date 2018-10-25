# -*- coding: utf-8 -*-
"""
Created on Sat Oct 13 00:11:49 2018

@author: RATOM
"""

import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.datasets import load_breast_cancer
from sklearn.cross_validation import train_test_split
from sklearn.svm import SVC
from sklearn.grid_search import GridSearchCV

from sklearn.metrics import confusion_matrix,classification_report
cancer=load_breast_cancer()
#print(cancer.keys())
#print(cancer['DESCR'])
df=pd.DataFrame(cancer['data'])

X=df
y=cancer['target']
X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.3,random_state=101)

model=SVC()
model.fit(X_train,y_train)
pred=model.predict(X_test)
#print(confusion_matrix(y_test,pred))
#print(classification_report(y_test,pred))

param={'C':[0.1,1,10,100],'gamma':[1,0.1,0.01,0.001]}
gird=GridSearchCV(SVC(),param,verbose=2)

gird.fit(X_train,y_train)
prediction=gird.predict(X_test)

print(confusion_matrix(y_test,prediction))
print(classification_report(y_test,prediction))

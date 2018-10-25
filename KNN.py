# -*- coding: utf-8 -*-
"""
Created on Thu Oct 11 23:29:40 2018

@author: RATOM
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler
from sklearn.cross_validation import train_test_split
from sklearn.metrics import confusion_matrix,classification_report
from sklearn.neighbors import KNeighborsClassifier


df1=pd.read_csv("datasets/KNN_Project_Data")

#sns.pairplot(df,hue='TARGET CLASS',palette='coolwarm')
std=StandardScaler()
std.fit(df1.drop('TARGET CLASS',axis=1))
scaled_features=std.transform(df1.drop('TARGET CLASS',axis=1))
df=pd.DataFrame(scaled_features,columns=df1.columns[:-1])
X=df
y=df1['TARGET CLASS']
X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.3,random_state=101)
knn=KNeighborsClassifier()
knn.fit(X_train,y_train)
prediction=knn.predict(X_test)
print(classification_report(y_test,prediction))
print(confusion_matrix(y_test,prediction))

errorRate=[]
for i in range(1,40):
    kn=KNeighborsClassifier(n_neighbors=i)
    kn.fit(X_train,y_train)
    pred_i=kn.predict(X_test)
    errorRate.append(np.mean(y_test!=pred_i))

plt.figure(figsize=(10,7))
plt.title("error rate vs k value")
plt.plot(range(1,40),errorRate,color='blue',linestyle='dashed',marker='o',
         markerfacecolor='red',markersize=10)
plt.xlabel("K")
plt.ylabel("error rate")
plt.show()
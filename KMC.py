# -*- coding: utf-8 -*-
"""
Created on Thu Oct 25 14:33:22 2018

@author: RATOM
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.cluster import KMeans
from sklearn.metrics import confusion_matrix,classification_report


df=pd.read_csv("datasets/College_Data",index_col=0)
#sns.lmplot(x="Room.Board",y="Grad.Rate",data=df,hue="Private",fit_reg=False)
df["Grad.Rate"]["Cazenovia College"]=100

kmeans=KMeans(n_clusters=2)
kmeans.fit(df.drop("Private", axis=1))
#print(kmeans.cluster_centers_)
def convertor (private):
    if private=="Yes":
        return 1
    else:
        return 0
df["Cluster"]=df["Private"].apply(convertor)
#print(df["Cluster"])
print(classification_report(df["Cluster"],kmeans.labels_))
print("**********************")
print(confusion_matrix(df["Cluster"],kmeans.labels_))


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler
from sklearn.cross_validation import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import confusion_matrix,classification_report

df1=pd.read_csv("datasets/Classified Data")


scale=StandardScaler()
scale.fit(df1.drop('TARGET CLASS', axis=1))
feature=scale.transform(df1.drop('TARGET CLASS', axis=1))

df=pd.DataFrame(feature,columns=df1.columns[:-1])
X=df
y=df1['TARGET CLASS']
X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.3,random_state=101)

knn=KNeighborsClassifier()
knn.fit(X_train,y_train)
prediction=knn.predict(X_test)
print(confusion_matrix(y_test,prediction))
print(classification_report(y_test,prediction))

error_rate=[]
for i in range(1,40):
    knn=KNeighborsClassifier(n_neighbors=i)
    knn.fit(X_train,y_train)
    prediction_i=knn.predict(X_test)
    error_rate.append(np.mean(y_test!=prediction_i))

plt.Figure(figsize=(10,10))
plt.plot(range(1,40),error_rate,color='blue',linestyle='dashed',marker='o',
         markerfacecolor='red',markersize=10)
plt.title("plot of k values and error")
plt.xlabel("K")
plt.ylabel("error rate")
plt.show()

knn=KNeighborsClassifier(n_neighbors=30)
knn.fit(X_train,y_train)
prediction=knn.predict(X_test)
print(confusion_matrix(y_test,prediction))
print(classification_report(y_test,prediction))
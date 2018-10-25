import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.cross_validation import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import classification_report,confusion_matrix

df=pd.read_csv("datasets/advertising.csv")

#sns.heatmap(df.isnull())
#df.info()
#print(df.describe())
X=df[['Daily Time Spent on Site','Age','Area Income','Daily Internet Usage','Male']]
y=df['Clicked on Ad']

X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.3,random_state=101)
lr=LogisticRegression()
lr.fit(X_train,y_train)
prediction=lr.predict(X_test)
print(confusion_matrix(y_test,prediction))
print("**************************************************")
print(classification_report(y_test,prediction))

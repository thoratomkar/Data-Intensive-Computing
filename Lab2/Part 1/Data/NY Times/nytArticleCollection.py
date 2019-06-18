# -*- coding: utf-8 -*-
"""
Created on Thu Mar 28 15:34:34 2019

@author: abhis
"""
#Group Members: Omkar Thorat and Abhishek Bhave


import json
import time
import pandas as pd
from nytimesarticle import articleAPI
from bs4 import BeautifulSoup
import requests
session=requests.Session()
#api = articleAPI('6omL4JqC1GAjTx3v0ZuoRFSgPA38iHA0')
api = articleAPI('cAlsZVZOZ1rE10rSKP0ZzFi9QjLiyJmt')


def getSearch(query):
    l=[]
    for i in range(1,50):
        articles = api.search( q = query ,begin_date = 20190101,page=i)
        print(i)
        time.sleep(6)
        x=articles['response']
        y=x['docs']
        for j in range(0,len(y)):
            a=y[j]
            final=a['web_url']
            l.append(final)
    return l


def getDatafromURL(file): 
    x=file.iloc[:,1]
    l=[]
    problem_url=[]
    for i in range(0,len(x)):
        y=str(x[i])
        if(len(y)>5):
            try:
                req = session.get(y)
                soup = BeautifulSoup(req.text,"lxml")
                paragraphs = soup.find_all('p', class_='css-1ygdjhk evys1bk0')
                article = ""
                for i in paragraphs:
                    article = article + i.get_text()
            except:
                print("url problem for " + y)
                problem_url.append(y)
            if(len(article)>0):
                l.append(article)
    return l
  

#l=getSearch('border wall')
#l=pd.DataFrame(l)
#l.to_csv('border_wall417.csv')
#
#file=pd.read_csv('border_wall417.csv')
#l=getDatafromURL(file)
#l=pd.DataFrame(l)
#l.to_csv('border_wall417_content.csv')

l=getSearch('illegal immigration')
l=pd.DataFrame(l)
l.to_csv('illegal_immigration420.csv')

file=pd.read_csv('illegal_immigration420.csv')
l=getDatafromURL(file)
l=pd.DataFrame(l)
l.to_csv('illegal_immigration420content.csv')

    
l=getSearch('migrant caravan')
l=pd.DataFrame(l)
l.to_csv('migrant_caravan420.csv')

file=pd.read_csv('migrant_caravan420.csv')
l=getDatafromURL(file)
l=pd.DataFrame(l)
l.to_csv('migrant_caravan420420content.csv')

	
	



# -*- coding: utf-8 -*-
"""
Created on Sun Apr 21 20:04:40 2019

@author: abhis
"""

#Group Members: Omkar Thorat and Abhishek Bhave


import glob
import os
import json
import time
import pandas as pd
from nytimesarticle import articleAPI
from bs4 import BeautifulSoup
import requests
session=requests.Session()


allfiles=[i for i in glob.glob('*.{}'.format('csv'))]
df=pd.concat([pd.read_csv(f) for f in allfiles])
df.to_csv('mergedWP.csv',index=False,encoding='utf-8-sig')


def getDatafromURL(file): 
    x=file.iloc[:,0]
    l=[]
    hm={}
    problem_url=[]
    for i in range(0,len(x)):
        print(i)
        y=str(x[i])
        if y not in hm:
            hm[y]=1
            if(len(y)>5):
                try:
                    req = session.get(y)
                    soup = BeautifulSoup(req.text,"lxml")
                    paragraphs = soup.find_all('div', class_="article-body")
                    print(paragraphs)
                    article = ""
                    for i in paragraphs:
                        article = article + i.get_text()
                except:
                    print("url problem for " + y)
                    problem_url.append(y)
                if(len(article)>0):
                    l.append(article)
    return l
  
#read links file here
file=pd.read_csv('mergedWP.csv')
l=getDatafromURL(file)
l=pd.DataFrame(l)
l.to_csv('merged_contentWP.csv')

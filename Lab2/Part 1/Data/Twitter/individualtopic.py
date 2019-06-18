# -*- coding: utf-8 -*-
"""
Created on Sun Apr 21 19:31:42 2019

@author: abhis
"""
#Group Members: Omkar Thorat and Abhishek Bhave


import glob
import os
import pandas as pd
import io 
from nltk.corpus import stopwords 
from nltk.tokenize import word_tokenize 
import re
import nltk
from nltk.stem import PorterStemmer 


df=pd.read_csv('shutdown04-20.csv')
dup={}
final=[]


#https://stackoverflow.com/questions/33404752/removing-emojis-from-a-string-in-python
def deEmojify(inputString):
    return inputString.encode('ascii', 'ignore').decode('ascii')

#https://www.geeksforgeeks.org/python-stemming-words-with-nltk/
def stem(input):
    ps = PorterStemmer()
    s=''    
    words = word_tokenize(input)    
    for w in words: 
        s=s+ps.stem(w)+' ' 
    return s 

for i in range(0,len(df)):
    y=df.at[i,'0']
    if y not in dup:
        temp=deEmojify(y)
        dup[y]=1
        line=''
        #https://stackoverflow.com/questions/11331982/how-to-remove-any-url-within-a-string-in-python/49257661
        temp=re.sub('http[s]?://\S+', '', temp)
        for words in temp:
            #x = ' '.join(words)
            x = re.sub(r' {1}[a-zA-Z0-9]+…$','',words)
            x = re.sub(r'[\)\( \/\.-][0-9]+[ \)\/\.\(-]',' ',x)
            #x = x.replace('.',' ')
            x = re.sub(r'@\S+', '', x)
            x = x.lower()
            x = x.replace("'s","")
            x = re.sub(r"[^a-zA-Z0-9 ]+", ' ', x)
            x = re.sub(r'[ ][0-9]+ ','',x)
            line+=x
        #c=stem(line)
        line+='.'
        final.append(line)

#https://stackabuse.com/reading-and-writing-lists-to-a-file-in-python/
with open('IndSHYT.txt', 'w') as filehandle:  
    filehandle.writelines("%s\n" % place for place in final)

#remove stop words
#https://www.geeksforgeeks.org/removing-stop-words-nltk-python/

#nltk.download('stopwords')    
#word_tokenize accepts a string as an input, not a file.
final=[]
stop_words = set(stopwords.words('english')) 
file1 = open("IndSHYT.txt") 
line = file1.read()# Use this to read file content as a stream: 
words = line.split() 
#print(words)
s=''
for r in words: 
    if not r in stop_words:
        if(r=='.'):
            s+=r+'\n'
            final.append(" "+s)
            s=' '
        else:
            s+=r+' '
        
with open('ISHNYT.txt', 'w') as filehandle:  
    filehandle.writelines("%s\n" % place for place in final)

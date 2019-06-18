# -*- coding: utf-8 -*-
"""
Created on Sat Apr 20 17:56:56 2019

@author: abhis
"""
#Group Members: Omkar Thorat and Abhishek Bhave


import operator
#https://www.quora.com/How-can-I-print-the-10-biggest-values-from-a-Python-dictionary-where-key-string-and-value-int-in-range-1-n

hm={}
file = open("part-00000", "r") 
for line in file: 
    #print(line)
    x=(line.split())
    if x[0] in hm:
        hm[x[0]]+=int(x[1])
    else:
        hm[x[0]]=int(x[1])

newHM = dict(sorted(hm.items(), key=operator.itemgetter(1), reverse=True)[:50])
listOfWords=newHM.keys()
listValue=newHM.values()

outF = open("TwitterTop50.txt", "w")
for word in listOfWords:
  outF.write(word+"-"+str(newHM[word]))
  #outF.write(word)
  outF.write("\n")
outF.close()        

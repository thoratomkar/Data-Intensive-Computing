# -*- coding: utf-8 -*-
"""
Created on Sun May  4 14:48:13 2019

@author: omkar
"""
from pyspark.ml.classification import LogisticRegression
from pyspark.ml.evaluation import MulticlassClassificationEvaluator
from pyspark.ml import Pipeline
from pyspark.ml.feature import StringIndexer
from sklearn.datasets import fetch_20newsgroups
from pyspark.ml.feature import RegexTokenizer, StopWordsRemover, CountVectorizer

trainingData = fetch_20newsgroups(subset='train', shuffle=True)
testData = fetch_20newsgroups(subset='test', shuffle=True)


regexTokenizer = RegexTokenizer(inputCol="Descript", outputCol="words", pattern="\\W")

add_stopwords = ["and","is","this","at","the"] 
stopwordsRemover = StopWordsRemover(inputCol="words", outputCol="filtered").setStopWords(add_stopwords)

countVectors = CountVectorizer(inputCol="filtered", outputCol="features", vocabSize=10000, minDF=5)
                               


label_stringIdx = StringIndexer(inputCol = "Category", outputCol = "label")
pipeline = Pipeline(stages=[regexTokenizer, stopwordsRemover, countVectors, label_stringIdx])
# Fit the pipeline to training documents.
pipelineFit = pipeline.fit(trainingData)
dataset = pipelineFit.transform(trainingData)

lr = LogisticRegression(maxIter=20, regParam=0.3, elasticNetParam=0)
lrModel = lr.fit(trainingData)
predictions = lrModel.transform(testData)
predictions.filter(predictions['prediction'] == 0) \
    .select("Descript","Category","probability","label","prediction") \
    .orderBy("probability", ascending=False) \
    .show(n = 10, truncate = 30)
    

evaluator = MulticlassClassificationEvaluator(predictionCol="prediction")
evaluator.evaluate(predictions)









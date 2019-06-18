#!/usr/bin/env python

import sys, re


for line in sys.stdin:
    line = line.strip()
    words = line.split()
    for i in range(0,len(words)):
        for j in range(0,len(words)):
            if i!=j:
                print("%s%s\t%d" % (words[i]+' ', words[j], 1))
            
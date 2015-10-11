"""
Given a number, convert the number to its binary representation
"""
import sys

test_cases = open(sys.argv[1], 'r')
for test in test_cases:
    binaryStr = bin(int(test.strip()))
    print (binaryStr[2:]) # remove the 0b heading produced by the bin api

"""
Walkthrough for:

Python Substring API
----------

>>> x = "Hello World!"
>>> x[2:]
'llo World!'
>>> x[:2]
'He'
>>> x[:-2]
'Hello Worl'
>>> x[-2:]
'd!'
>>> x[2:-2]
'llo Worl'

"""
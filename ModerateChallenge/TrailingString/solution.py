"""
Problem Statement:
---------------------
There are two strings, A and B. 
Print 1 if string B occurs at the end of string A. 
Otherwise, print 0.
"""
import sys
import re

def is_trailing_string(value) :
    str_parts = value.split(",")
    str_a = str_parts[0]
    str_b = str_parts[1]

    # Check to see if str_b occurs as the trailing string
    pattern = re.compile(str_b + "$")
    
    # Note: If you are directly using a string search pattern like
    # "(abc)d" then you will need to supply the 'r' value when doing search
    # Example re.search(r"(abc)d", search_value)
    return 1 if re.search(pattern, str_a) else 0


test_cases = open(sys.argv[1], 'r')
for test in test_cases:
    print (is_trailing_string(test.strip()))
    
test_cases.close()
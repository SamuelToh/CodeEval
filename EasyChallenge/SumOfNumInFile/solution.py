import sys

globalVariable = 0

test_cases = open(sys.argv[1], 'r')
for test in test_cases:
    if (test.rstrip().isdigit()):
        globalVariable += int(test)
    
test_cases.close()
print (str(globalVariable))
"This is a comment - sys.stdout.write(str(globalVariable))"
import sys
from __future__ import print_function


INDENTATION_WHITESPACES = "    "
MAX_MULTIPLICATION = 13

for base_multiplier in range(1, MAX_MULTIPLICATION):
    for multiplier in range(1, MAX_MULTIPLICATION):
        print('{:4}'.format(base_multiplier * multiplier), end="")
    print("")
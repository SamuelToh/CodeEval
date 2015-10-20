import os
import sys

# UTF-8 => 1 character is 1 byte, which is 8 bits
# Note this includes whitespace. 1 whitespace for 1 byte
filepath = sys.argv[1]
print(os.path.getsize(filepath)) # getsize prints size in byte
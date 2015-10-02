import sys

def swapcase(character):
    "returns the opposite case of the given character"
    if character == character.upper():
        return character.lower()
    else:
        return character.upper()


test_cases = open(sys.argv[1], 'r')
for test in test_cases:
    swappedcase = ""
    characters = list(test)
    for character in characters:
        swappedcase += swapcase(character)
    sys.stdout.write(swappedcase)

test_cases.close()
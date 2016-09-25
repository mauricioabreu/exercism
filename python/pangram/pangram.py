import string

def is_pangram(statement):
    return all(letter in statement.lower() for letter in string.lowercase)

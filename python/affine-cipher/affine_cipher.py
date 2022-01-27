import functools
import itertools
import math
import string

alphabet = string.ascii_letters


def cipher_func(f, x):
    if x in alphabet:
        index = f(x)
        return alphabet[index]
    if x.isdigit():
        return x
    return None


def encr(a, b, x):
    return (a * alphabet.index(x) + b) % 26
    

def decr(a, b, x):
    return mmi(a, 26) * (alphabet.index(x) - b) % 26


def is_coprime(x, y):
    return math.gcd(x, y) == 1


def groups_of(iterable, size):
    it = iter(iterable)
    return iter(lambda: tuple(itertools.islice(it, size)), ())


def mmi(a, m):
    return pow(a, -1, m)


def encode(plain_text, a, b):
    if not is_coprime(a, 26):
        raise ValueError("a and m must be coprime.")
    _encr = functools.partial(encr, a, b)
    cfunc = functools.partial(cipher_func, _encr)
    equivalents = list(filter(None, map(cfunc, plain_text)))
    groups = groups_of(equivalents, 5)
    return " ".join(list(map("".join, groups)))


def decode(ciphered_text, a, b):
    if not is_coprime(a, 26):
        raise ValueError("a and m must be coprime.")
    _decr = functools.partial(decr, a, b)
    cfunc  = functools.partial(cipher_func, _decr)
    return "".join(list(filter(None, map(cfunc, ciphered_text))))
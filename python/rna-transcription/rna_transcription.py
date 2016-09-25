import string


def to_rna(strand):
    translation = string.maketrans('GCTA', 'CGAU')
    return strand.translate(translation)

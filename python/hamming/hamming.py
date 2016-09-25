def distance(strand1, strand2):
    return sum([strand[0] != strand[1] for strand
                in zip(strand1, strand2)])

def steps(number):
    if number <= 0:
        raise ValueError("Only positive numbers are allowed")
    if number == 1:
        return 0
    if  number % 2 == 0:
        return 1 + steps(number / 2)
    else:
        return 1 + steps(number * 3 + 1)
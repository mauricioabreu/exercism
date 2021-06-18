class Luhn:
    def __init__(self, card_num):
        self.card_num = card_num.replace(" ", "")

    def valid(self):
        if not self.card_num.isdigit():
            return False
        
        digits = self.to_digits()
        
        if len(digits) <= 1:
            return False

        checksum = sum([
            self.double(digit) if idx % 2 != 0 else digit
            for idx, digit in enumerate(reversed(digits))
        ])

        return checksum % 10 == 0
    
    def to_digits(self):
        return list(map(int, self.card_num))

    def double(self, digit):
        doubled = digit * 2
        if doubled > 9:
            return doubled - 9
        return doubled
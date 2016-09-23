class Clock:
    def __init__(self, hour, minute):
        self.hour = hour
        self.minute = minute
        self.set_time()

    def __str__(self):
        return '{0:02d}:{1:02d}'.format(self.hour, self.minute)

    def __eq__(self, clock):
        return str(self) == str(clock)

    def add(self, minutes):
        self.minute += minutes
        return self.set_time()

    def set_time(self):
        self.hour += self.minute // 60
        self.hour %= 24
        self.minute %= 60
        return self

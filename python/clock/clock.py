class Clock:

  def __init__(self, hours, minutes):
    self.hours = hours
    self.minutes = minutes
    self.time = None

  def __str__(self):
    return self.clock_time()

  def __eq__(self, other):
    if isinstance(other, self.__class__):
        return self.clock_time() == other.clock_time()
    else:
        return False

  def clock_time(self):
    if not self.time:
      hours, minutes = self.convert()
      self.time = self.pretty_string(hours, minutes)
    return self.time

  def add(self, minutes):
    self.minutes += minutes
    return self

  def convert(self):
    hours = str((self.hours + self.minutes // 60) % 24)
    minutes = str(self.minutes % 60)
    return((hours, minutes))

  def pretty_string(self, hours, minutes):
    if len(hours) == 1:
      hours = "0" + hours
    if len(minutes) == 1:
      minutes = "0" + minutes
    return hours + ':' + minutes



module Gigasecond
  def self.from(from_time : Time)
    from_time + (10**9).seconds
  end
end

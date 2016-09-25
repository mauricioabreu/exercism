module Raindrops
  def self.drops(number : Int)
    result = String.build do |str|
      str << "Pling" if number % 3 == 0
      str << "Plang" if number % 5 == 0
      str << "Plong" if number % 7 == 0
    end
    result.empty? ? number.to_s : result
  end
end

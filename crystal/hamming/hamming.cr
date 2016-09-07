module Hamming
  def self.compute(strand1 : String, strand2 : String)
    if strand1.size != strand2.size
        raise ArgumentError.new(message = "strands aren't of equal length")
    end
    
    occurrences = 0
    strand1.size.times do |index|  
        occurrences += 1 if strand1[index] != strand2[index]
    end
    occurrences
  end
end

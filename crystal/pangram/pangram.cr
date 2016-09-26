module Pangram
  def self.pangram?(statement)
    ('a'..'z').map { |l| statement.downcase.includes?(l) }.all?
  end
end

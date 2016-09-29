module Pangram
  def self.pangram?(statement)
    ('a'..'z').all? { |l| statement.downcase.includes?(l) }
  end
end

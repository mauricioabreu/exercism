module Pangram
  def self.pangram?(statement)
    ('a'..'z').to_a.map { |l| statement.downcase.includes?(l) }.all?
  end
end

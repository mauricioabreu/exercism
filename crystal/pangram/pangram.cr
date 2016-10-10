module Pangram
  def self.pangram?(statement)
    downcase_statement = statement.downcase
    ('a'..'z').all? { |l| downcase_statement.includes?(l) }
  end
end

module Bob
  def self.hey(message : String)
    if message.upcase == message && message =~ /[[:alpha:]]/
      "Whoa, chill out!"
    elsif message.ends_with?("?")
      "Sure."
    elsif message.strip.empty?
      "Fine. Be that way!"
    else
      "Whatever."
    end
  end
end

module PhoneNumber
  def self.clean(number)
    phone = number.scan(/\d+/).join[/[^1?]\d+/]
    phone unless phone.length != 10 ||
                 phone.start_with?('0') ||
                 phone.match(/\d+[1|0]\d+/)
  end
end


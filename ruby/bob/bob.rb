module Bob
  Response = {
    silence: 'Fine. Be that way!',
    yelling: 'Whoa, chill out!',
    asking: 'Sure.',
    asking_loudly: "Calm down, I know what I'm doing!",
    default: 'Whatever.'
  }

  Silence = ->(t) { t.gsub(/\s/, '').empty? }
  Yelling = ->(t) { t == t.upcase && t =~ /[A-Z]/ }
  Asking = ->(t) { t =~ /\?\z/ }
  AskingLoudly = ->(t) { Asking[t] && Yelling[t] }

  def self.hey(text)
    Response[statement(text)]
  end

  def self.statement(phrase)
    case phrase.strip
    when AskingLoudly
      :asking_loudly
    when Yelling
      :yelling
    when Silence
      :silence
    when Asking
      :asking
    else
      :default
    end
  end
end

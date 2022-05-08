class Bob
  Response = {
    silence: 'Fine. Be that way!',
    yelling: 'Whoa, chill out!',
    asking: 'Sure.',
    statement: 'Whatever.',
    asking_loudly: "Calm down, I know what I'm doing!",
  }
  Silence = ->(t) { t.gsub(/\s/, '').empty? }
  Asking = ->(t) { t =~ /\?\z/ }
  Yelling = ->(t) { t == t.upcase && t =~ /[A-Z]/ }
  AskingLoudly = ->(t) { Asking[t] && Yelling[t] }

  def self.hey(text)
    Bob.new.hey(text)
  end

  def hey(text)
    @phrase = text
    Response[statement_style]
  end

  private

  def statement_style
    case @phrase.strip
    when AskingLoudly
      :asking_loudly
    when Yelling
      :yelling
    when Silence
      :silence
    when Asking
      :asking
    else
      :statement
    end
  end
end

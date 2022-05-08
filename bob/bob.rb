require 'set'

class Bob
  def self.hey(sentence)
    sentence.gsub!(' ', '')

    return 'Fine. Be that way!' if sentence.empty?
    if is_question?(sentence) && (sentence.split('') - ('A'..'Z').to_a - %w[! ' ? % ^ * @ \ # $ ( *]).empty?
      return "Calm down, I know what I'm doing!"
    end

    return 'Whoa, chill out!' if is_only_capitals?(sentence)

    return 'Sure.' if is_question?(sentence)

    if Set[
         *(
           sentence.split('') - ('A'..'Z').to_a - ('a'..'z').to_a -
             %w[: ! ' ? % ^ * @ \ # $ ( * . , 1 2 3 4 5 6 7 8 9 - )] - (1..9).to_a
         ).uniq
       ] == Set["\t", "\n", "\r"]
      return 'Fine. Be that way!'
    end
    if Set[
         *(
           sentence.split('') - ('A'..'Z').to_a - ('a'..'z').to_a -
             %w[: ! ' ? % ^ * @ \ # $ ( * . , 1 2 3 4 5 6 7 8 9 - )] - (1..9).to_a
         ).uniq
       ] == Set["\t"]
      return 'Fine. Be that way!'
    end
    return 'Whatever.'
  end

  private

  def self.is_only_capitals?(sentence)
    sentence == sentence.upcase && sentence.downcase != sentence.upcase
  end

  def self.is_question?(sentence)
    sentence[-1] == '?'
  end
end

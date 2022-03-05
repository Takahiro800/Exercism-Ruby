module Acronym
  def self.abbreviate(text)
    arr =  text.gsub('-', ' ').split(' ')
    arr.map{ |e| e[0].upcase}.join
  end
end

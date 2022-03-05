module ResistorColorDuo
  COLOR_TO_VALUE = {
    "black"=> "0",
    "brown"=> "1",
    "red"=> "2",
    "orange"=> "3",
    "yellow"=> "4",
    "green"=> "5",
    "blue"=> "6",
    "violet"=> "7",
    "grey"=> "8",
    "white"=> "9"
  }

  def self.value(colors)
    c1, c2 = colors
    (COLOR_TO_VALUE[c1].to_s + COLOR_TO_VALUE[c2].to_s).to_i
  end
end
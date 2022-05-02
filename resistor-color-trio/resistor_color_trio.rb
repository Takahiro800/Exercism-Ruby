class ResistorColorTrio
  COLOR_TO_VALUE = {
    'black' => '0',
    'brown' => '1',
    'red' => '2',
    'orange' => '3',
    'yellow' => '4',
    'green' => '5',
    'blue' => '6',
    'violet' => '7',
    'grey' => '8',
    'white' => '9',
  }

  def initialize(colors)
    @colors = colors
  end

  def label
    raise ArgumentError unless (@colors - COLOR_TO_VALUE.keys).empty?
    c1, c2, c3 = @colors
    value = 'Resistor value: ' + COLOR_TO_VALUE[c1] + COLOR_TO_VALUE[c2] + change_num(c3)
    return select_unit(value)
  end

  private

  def change_num(color)
    return '0' * COLOR_TO_VALUE[color].to_i
  end

  def select_unit(value)
    if value.include?('000')
      return value[0..-4] + ' kiloohms'
    else
      return value + ' ohms'
    end
  end
end
p ResistorColorTrio.new(%w[yellow violet yellow]).label

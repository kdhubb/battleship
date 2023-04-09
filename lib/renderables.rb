module Renderables
  
  def empty?
    @ship == nil
  end

  def fired_upon?
    @fired_upon
  end
  
  def render(param = false)
  
    if param == false
      if !fired_upon?
        "."
      elsif empty? && fired_upon?
        "M"
      elsif fired_upon? && !empty? && !@ship.sunk?
        "H"
      elsif fired_upon? && !empty? && @ship.sunk?
        "X"
      end
    elsif param == true
      if !fired_upon? && empty?
        "."
      elsif !fired_upon? && !empty?
        "S"
      elsif empty? && fired_upon?
        "M"
      elsif fired_upon? && !empty? && !@ship.sunk?
        "H"
      elsif fired_upon? && !empty? && @ship.sunk?
        "X"
      end
    end
  end
end

if self.is_a?(Hash)
  illustrated = []
  @cells.each_value do |cell|
    illustrated << cell.render
  end
  return_array = []
  illustrated.each_slice(4) do |line|
    return_array << line
  end
  "  1 2 3 4 \nA #{return_array[0].join(" ")} \nB #{return_array[1].join(" ")} \nC #{return_array[2].join(" ")} \nD #{return_array[3].join(" ")} \n"
end
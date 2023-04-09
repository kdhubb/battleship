module Renderables
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
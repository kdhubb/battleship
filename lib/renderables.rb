module Renderables
  
  def empty?
    @ship == nil
  end

  def fired_upon?
    @fired_upon
  end
  
  def render(param = false)
    if param == false
      if fired_upon? && !empty? && @ship.sunk?
        "X"
      elsif fired_upon? && !empty? && !@ship.sunk?
        "H"
      elsif !fired_upon?
        "."
      elsif empty? && fired_upon?
        "M"
      end
    elsif param == true
      if fired_upon? && !empty? && @ship.sunk?
        "X"
      elsif fired_upon? && !empty? && !@ship.sunk?
        "H"
      elsif !fired_upon? && empty?
        "."
      elsif !fired_upon? && !empty?
        "S"
      elsif empty? && fired_upon?
        "M"
      end
    end
  end
end

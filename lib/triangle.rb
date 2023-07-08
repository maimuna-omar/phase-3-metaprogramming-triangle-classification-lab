class Triangle
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    validate_triangle
  end

  def kind
    if equilateral?
      :equilateral
    elsif isosceles?
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    sides = [@side1, @side2, @side3]

    if sides.any?(&:zero?) || sides.any?(&:negative?)
      raise TriangleError, "Invalid triangle sides: All sides must be positive."
    elsif @side1 + @side2 <= @side3 || @side2 + @side3 <= @side1 || @side1 + @side3 <= @side2
      raise TriangleError, "Invalid triangle sides: Triangle inequality violated."
    end
  end

  def equilateral?
    @side1 == @side2 && @side2 == @side3
  end

  def isosceles?
    @side1 == @side2 || @side1 == @side3 || @side2 == @side3
  end

  class TriangleError < StandardError
  end
end

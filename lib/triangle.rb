class Triangle
  
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def valid_triangle?
    test_for_inequality = [(a + b > c), (a + c > b), (b + c > a)]
    triangle_test_for_0_side = [a, b, c].map {|side| side > 0 ? true : false}
    if triangle_test_for_0_side.include? false
      raise TriangleError
    elsif test_for_inequality.include? false
      raise TriangleError
    end
  end

  def kind
    valid_triangle?
    if a == b && b == c
      :equilateral
    elsif a == b || a == c || b == c
      :isosceles
    else
      :scalene
    end
  end
    
  class TriangleError < StandardError
  end

end

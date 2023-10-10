class Car
  def initialize(color)
    @color = color
  end

  def color
    @color
  end
end

class Human
  def favorite_car(car)
    if car.color == "black"
      p "この色は好き"
    else
      p "この色は嫌い"
    end
  end
end

black_car = Car.new("black")
red_car = Car.new("red")
man = Human.new

man.favorite_car(black_car)
man.favorite_car(red_car)
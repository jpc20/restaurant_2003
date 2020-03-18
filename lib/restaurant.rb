
class Restaurant
  attr_reader :opening_time, :name, :dishes
  def initialize(opening_time, name)
    @opening_time = opening_time
    @name = name
    @dishes = []
  end

  def closing_time(hours)
    (@opening_time.to_i + hours).to_s.concat(':00')
  end

  def add_dish(dish)
    @dishes << dish
  end

  def open_for_lunch?
    return true if @opening_time.to_i < 12
    false
  end

  def menu_dish_names
    @dishes.map do |dish|
      dish.upcase
    end
  end

  def announce_closing_time(hours)
    closing = ''
    if @opening_time.to_i + hours < 13
      closing = (@opening_time.to_i + hours).to_s.concat(':00AM')
    elsif @opening_time.to_i + hours >= 13
      closing = ((@opening_time.to_i + hours) - 12).to_s.concat(':00PM')
    end

    return "#{@name} will be closing at #{closing}"
  end

end

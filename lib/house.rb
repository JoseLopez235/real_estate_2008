class House
  attr_reader :price, :address, :rooms
  def initialize(price,address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    @rooms.find_all {|room| room.category == category}
  end

  def area
    total = 0
    @rooms.each {|room| total += room.area}
    total
  end

  def details
    details = {}
    details["price"] = @price
    details["address"] = @address
    details
  end
end

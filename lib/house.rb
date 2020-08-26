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

  def price_per_square_foot
    price = (@price.delete("$")).to_f
    (price / area).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort {|room1,room2| room1.area <=> room2.area}.reverse!
  end

  def rooms_by_category
    hash_category = {}
    @rooms.each do |room|
      if hash_category[room.category].nil?
        hash_category[room.category] = rooms_from_category(room.category)
      end
    end
    hash_category
  end
end

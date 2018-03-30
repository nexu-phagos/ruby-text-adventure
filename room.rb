class Room
  attr_accessor :items, :room_gold
  def initialize(area,coords,title,short_desc,long_desc)
    @area = area
    @coords = coords
    @title = title
    @short_desc = short_desc
    @long_desc = long_desc
  end
  def area
    @area
  end
  def title
    @title
  end
  def short_desc
    @short_desc
  end
  def long_desc
    @long_desc
  end
  def items
    @items
  end
  def list_items
    @items.map do |obj|
      puts "* #{obj.name}"
    end
  end
  def coords
    @coords
  end
  def room_gold
    @room_gold
  end
  def generate_room_loot
    d10 = rand(1..10)
    # puts "ROLLED #{d10} in #{@title}"
    if d10 == 10
      @room_gold += rand(1..3)
    else
      @room_gold = 0
    end
  end
end

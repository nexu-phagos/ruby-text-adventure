class Player
  attr_accessor :inventory,:level,:req_exp, :exp, :hp, :attack, :defence, :current_room, :x_coords, :y_coords, :active_weapon, :active_armor, :cursor_x_coords, :cursor_y_coords, :cursor,:agility, :gold
  def inventory
    @inventory
  end
  def level
    @level
  end
  def exp
    @exp
  end
  def level_up
      @level+=1
      puts "Level up! You are now level #{@level}."
      adjust_stats
  end
  def adjust_stats
    @hp += 1 * (@level ** 1.18).floor
    @attack+= 1 * (@level ** 1.1).floor
    @defence+= 1 * (@level ** 1.1).floor
    @agility+= 1 * (@level ** 1.08).floor
  end
  def hp
    @hp
  end
  def gold
    @gold
  end
  def alive?
    @hp > 0
  end
  def dead(why_dead)
    @dead
    puts "#{why_dead}"
    sleep(1)
    puts "
                 ______
           _____/      \\_____
          |  _     ___   _   ||
          | | \\     |   | \\  ||
          | |  |    |   |  | ||
          | |_/     |   |_/  ||
          | | \\     |   |    ||
          | |  \\    |   |    ||
          | |   \\. _|_. | .  ||
          |                  ||
          |                  ||
          |    ~~~~~~~~~~    ||
          |                  ||
   \))_,._../.,(//,,..,,\||(,,.,\\,.((//"
     2.times{puts ""}
    exit(0)
  end
  def swing(enemy)
    @d20 = rand(1..20) # generate random number 1..20
    if @d20 == 20
      puts "You rolled #{@d20}. Your attack was CRITICAL!"
      sprinkle_damage_range = []
      sprinkle_damage_range = (0..@attack).to_a
      sprinkle_damage = sprinkle_damage_range.sample
      enemy.take_damage(@attack*3+sprinkle_damage)
    elsif @d20 == 1 # critical miss
      puts "You rolled #{@d20}. Ooh...bad miss. You trip and fall."
      enemy.take_damage(1) # stumbling damage
    elsif @d20 + @agility > enemy.defence + 10
      puts "You rolled #{@d20} and hit."
      sprinkle_damage_range = []
      sprinkle_damage_range = (0..@attack).to_a
      sprinkle_damage = sprinkle_damage_range.sample
      enemy.take_damage(@attack+sprinkle_damage)
    else
    puts "You rolled #{@d20} and missed."
    end
  end
  def take_damage(damage)
    @hp -= damage
    puts "You took #{damage} damage, and are on #{@hp} HP."
  end
  def list_inventory
    if @inventory.empty?
      puts "Your inventory is empty."
    else
      puts "INVENTORY:"
    @inventory.map do |obj|
      if obj.type == :potion
        puts " * #{obj.name}  | Effect: #{obj.effect} | G: #{obj.gold}"
      end
      if obj.type == :weapon
        puts " * #{obj.name} | A: #{obj.attack} | D: #{obj.defence} | G: #{obj.gold}"
      end
      if obj.type == :armor
        puts " * #{obj.name} | A: #{obj.attack} | D: #{obj.defence} | G: #{obj.gold}"
      end
    end
  end
  end
  def attack
    @attack
  end
  def agility
    @agility
  end
  def get(choice,room)
    choice = choice[4..choice.length]
    ObjectSpace.each_object(Room) do |room|
      if room.coords == @current_room
         room.items.each do |item|
           if item.name.include?(choice.capitalize)
           @inventory.push(item)
           puts "You picked up the #{item.name}."
           room.items.delete(item)
           end
        end
      end
    end
  end
  def get_gold(room)
    ObjectSpace.each_object(Room) do |room|
      if room.coords == @current_room
           if room.room_gold > 0
           @gold += room.room_gold
           puts "You picked up #{room.room_gold} gold."
           room.room_gold = 0
           end
        end
      end
    end
  def active_weapon
    @active_weapon
  end
  def defence
    @defence
  end
  def active_armor
    @active_armor
  end
  def equip(item)
    item = item[6..item.length]
    if item.nil?
      puts "Equip what?"
    else
    @inventory.map do |obj|
      if obj.name.downcase == item.downcase
        if obj.type == :weapon
        @active_weapon = obj
        puts "You equip the #{@active_weapon.name}. #{@active_weapon.quip}"
        break
      else
      #elsif obj.type == :armor
        @active_armor = obj
        puts "You equip the #{@active_armor.name}."
        end
      end
      end
    end
  end
  def use(item)
    item = item[4..item.length]
    if item.nil?
      puts "Use what?"
    else
    @inventory.map do |obj|
      if obj.name.downcase == item.downcase
        if obj.type == :potion
        @hp += obj.restore_hp
        puts "Restored #{obj.restore_hp} HP."
        @inventory.slice!(@inventory.index(obj))
        break
       else
        puts "Can't use that."
      end
      end
      end
    end
  end
  def x_coords
    @xcoords
  end
  def y_coords
    @ycoords
  end
  def cursor_x_coords
    @cursor_x_coords
  end
  def cursor_y_coords
    @cursor_y_coords
  end
  def current_room
    @current_room = [@x_coords,@y_coords]
  end
  def move_north
    @cursor_x_coords+=1
    if $VALID_ROOMS.include? [@cursor_x_coords,@cursor_y_coords]
      @x_coords+=1
    else
      puts "You cannot go north."
      @cursor_x_coords-=1
    end
  end
  def move_south
    @cursor_x_coords-=1
    if $VALID_ROOMS.include? [@cursor_x_coords,@cursor_y_coords]
      @x_coords-=1
    else
      puts "You cannot go south."
      @cursor_x_coords+=1
    end
  end
  def move_east
    @cursor_y_coords+=1
    if $VALID_ROOMS.include? [@cursor_x_coords,@cursor_y_coords]
      @y_coords+=1
    else
      puts "You cannot go east."
      @cursor_y_coords-=1
    end
  end
  def move_west
    @cursor_y_coords-=1
    if $VALID_ROOMS.include? [@cursor_x_coords,@cursor_y_coords]
      @y_coords-=1
    else
      puts "You cannot go west."
      @cursor_y_coords+=1
    end
  end
  def defence
    @defence
  end
  def next_level
    @next_level = 10 * ((@level+1) ** 2.3).floor
  end
  def status
    puts "-------------------------------------"
    puts "           ### STATUS ###            "
    puts "-------------------------------------"
    puts "HP: #{@hp}"
    puts "GOLD: #{@gold}"
    puts "LEVEL: #{@level}"
    puts "ATTACK: #{@attack}"
    puts "DEFENCE: #{@defence}"
    puts "AGILITY: #{@agility}"
    puts "POSITION: #{@current_room}"
    puts "--"
    puts "EXP: #{@exp} / #{@next_level})"
    list_inventory
    if @active_weapon.nil? == false
      puts "ACTIVE WEAPON: #{@active_weapon.name}"
      puts "  MODIFIED ATTACK: #{@attack + @active_weapon.attack} (#{@attack} + #{@active_weapon.attack})"
    else
      puts "No weapon equipped"
    end
    if @active_armor.nil? == false
      puts "ACTIVE ARMOR: #{@active_armor.name}"
      puts "  MODIFIED DEFENCE: #{@defence + @active_armor.defence} (#{@defence} + #{@active_armor.defence})"
    else
      puts "No armor equipped"
    end
      puts "MODIFIED AGILITY: #{@agility + @active_armor.agility + @active_weapon.agility} (#{@agility} + #{@active_weapon.agility} + #{@active_armor.agility})"

    puts "-------------------------------------"
    end
  end

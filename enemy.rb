class Enemy
  attr_accessor :location
  def initialize(hp,level, attack, defence,agility, gold, inventory,active_weapon,name,location,id)
    @hp = hp
    @level = level
    @attack = attack
    @defence = defence
    @agility = agility
    @gold = gold
    @active_weapon = active_weapon
    @inventory = inventory
    @name = name
    @location = location
    @id = id
    adjust_stats
  end
  def location
    @location
  end
  def level
    @level
  end
  def exp_drop
    @exp_drop = (15 * @level ** 1.1).floor
  end
  def hp
    @hp
  end
  def active_weapon
    @active_weapon
  end
  def alive?
    @hp > 0
  end
  def attack
    @attack
  end
  def agility
    @agility
  end
  def name
    @name
  end
  def id
    @id
  end
  def defence
    @defence
  end
  def gold
    @gold
  end
  def inventory
    @inventory
  end
  def swing(player)
    @d20 = rand(1..20)
    if @d20 == 20
      puts "#{@name} rolled #{@d20}. Its attack was CRITICAL!"
      player.take_damage(@attack*3)
    elsif @d20 == 1 # critical miss
      puts "#{@name} rolled #{@d20}."
      puts "Ooh...bad miss. #{@name} trips and falls."
      self.take_damage(1)
    elsif @d20 + @agility > player.defence + 12
      puts "#{@name} rolled #{@d20} and hit."
      sprinkle_damage_range = []
      sprinkle_damage_range = (0..@attack).to_a
      sprinkle_damage = sprinkle_damage_range.sample
      player.take_damage(@attack+sprinkle_damage)
    else
    puts "#{@name} rolled #{@d20} and missed."
    end
  end
  def take_damage(damage)
    @hp -= damage
    puts "#{@name} took #{damage} damage, and is on #{@hp} HP."
  end
  def adjust_stats
    @hp += 1 * (@level ** 1.18).floor
    @attack+= 1 * (@level ** 1.1).floor
    @defence+= 1 * (@level ** 1.1).floor
    @agility+= 1 * (@level ** 1.08).floor
  end
  def status
    puts "-------------------------------------"
    puts "           ### STATUS ###            "
    puts "-------------------------------------"
    puts "HP: #{@hp}"
    puts "LEVEL: #{@level}"
    puts "ATTACK: #{@attack}"
    puts "DEFENCE: #{@defence}"
    puts "AGILITY: #{@agility}"
    puts "POSITION: #{@location}"
    puts "--"
    #puts "EXP: #{@exp} / #{20 * ((@level+1) ** 2.3).floor}"
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
    #puts "MODIFIED AGILITY: #{@agility + @active_armor.agility + @active_weapon.agility} (#{@agility} + #{@active_weapon.agility} + #{@active_armor.agility})"

    puts "-------------------------------------"
    end
  end

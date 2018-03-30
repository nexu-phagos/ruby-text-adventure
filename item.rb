class Item
  attr_accessor :restore_hp, :quip
  def initialize(name,id,attack,defence,agility,gold,type)
    @name = name
    @id = id
    @attack = attack
    @defence = defence
    @agility = agility
    @type = type
    @gold = gold
  end
  def name
    @name
  end
  def id
    @id
  end
  def gold
    @gold
  end
  def attack
    @attack
  end
  def defence
    @defence
  end
  def agility
    @agility
  end
  def restore_hp
    @restore_hp
  end
  def type
    @type
  end
  def quip
    @quip
  end
  def effect
    unless @restore_hp.nil?
    @effect = "Restores #{@restore_hp} HP."
  end
  end
end

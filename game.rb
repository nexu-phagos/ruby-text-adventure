require_relative 'enemy'
require_relative 'item'
require_relative 'player'
require_relative 'room'

# TODO: Range of items. Range of enemies.

#--------------START-SETUP--------------#

# MAKE A PLAYER, SET BASE VARIABLES

## PLAYER STATS:

unarmed = Item.new("Unarmed",:unarmed,0,0,0,0,:weapon)
unarmored = Item.new("Unarmored",:unarmored,0,0,0,0,:armor)

player = Player.new
player.level = 1
player.hp = 18
player.gold = 0
player.attack = 2
player.defence = 1
player.agility = 1
player.inventory = []
player.active_weapon = unarmed
player.active_armor = unarmed
player.exp = 0
player.req_exp = 80

## PLAYER POSITION:

player.x_coords = 1
player.y_coords = 1
player.cursor_x_coords = 1
player.cursor_y_coords = 1
player.cursor = [player.cursor_x_coords,player.cursor_y_coords]



# MAKE THE MAP, SET BASE VARIABLES

$VALID_ROOMS = [[1,1], [1,2], [1,3], [2,1], [2,2], [2,3], [3,1], [3,2], [3,3], [4,1], [4,2], [4,3], [5,1], [5,2],
[5,3], [6,1], [6,2], [6,3], [7,1], [7,2], [7,3], [6,4], [3,5], [3,6], [3,7], [4,5], [4,6], [4,7],
[5,5], [5,6], [5,7], [6,5], [6,6], [6,7], [7,5], [7,6], [7,7]]

# --
  secret_cave_entrance = Room.new('Secret Cave',[1,1],'Secret Cave Entrance','at the entrance to the secret cave','looong desc')
  stallactite_den = Room.new('Secret Cave',[1,2],'Stallactite Den','in a glossy passageway lined with stalagmites','')
  glow_worm_nursery = Room.new('Secret Cave',[1,3],'Glow Worm Nursery','in a room full of glowing, wiggling lights','')
  abandoned_goblin_drinking_den = Room.new('Secret Cave',[2,1],'Abandoned Goblin Drinking Den','in what looks like it used to be a common room','')
  abandoned_goblin_quarters_east = Room.new('Secret Cave',[2,2],'Abandoned Goblin Quarters East','in the first half of the old goblin quarters','')
  abandoned_goblin_quarters_west = Room.new('Secret Cave',[2,3],'Abandoned Goblin Quarters West','in the storage portion of the goblin quarters','')
  charred_fire_room = Room.new('Secret Cave',[3,1],'Charred Fire Room','in a room with a large dead firepit in the center','')
  caveshroom_garden = Room.new('Secret Cave',[3,2],'Caveshroom Garden','in the caveshroom garden','')
  ethereal_pools = Room.new('Secret Cave',[3,3],'Ethereal Pools','in a carved-out room with an abyssal well','')
  crumbling_arches_east = Room.new('Secret Cave',[4,1],'Crumbling Arches East','under the eastern portion of the arches','')
  crumbling_arches_center = Room.new('Secret Cave',[4,2],'Crumbling Arches Center','under the central section of the arches','')
  crumbling_archest_west = Room.new('Secret Cave',[4,3],'Crumbling Archest West','under the western portion of the arches','')
  bright_glade_clearing = Room.new('Remote Glade',[5,1],'Bright Glade Clearing','in a luminescent forest clearing','')
  fallen_pine_root = Room.new('Remote Glade',[5,2],'Fallen Pine Root','next to the root end of a fallen pine tree','')
  fallen_pine_branches = Room.new('Remote Glade',[5,3],'Fallen Pine Branches','near the tip of the fallen pine','')
  ancient_hut = Room.new('Remote Glade',[6,1],'Ancient Hut','outside a patchy wooden hut','')
  mystic_pit = Room.new('Remote Glade',[6,2],'Mystic Pit','near a faintly glowing pit','')
  chalky_patch = Room.new('Remote Glade',[6,3],'Chalky Patch','on a well-worn patch of chalky ground','')
  overgrown_weed_patch = Room.new('Remote Glade',[7,1],'Overgrown Weed Patch','on an overgrown patch of land behind the hut','')
  collapsed_lair = Room.new('Remote Glade',[7,2],'Collapsed Lair','next to a caved-in entranceway','')
  waterfall_edge = Room.new('Remote Glade',[7,3],'Waterfall Edge','facing the river','')
  sandstone_bridge = Room.new('Bridge',[6,4],'Sandstone Bridge','on a sturdy bridge of light brown rock','')
  sandy_scrubland = Room.new('Corrupted Wilds',[3,5],'Sandy Scrubland','at a rocky outcrop, dotted with scrub','')
  heather_patch = Room.new('Corrupted Wilds',[3,6],'Heather Patch','amidst purple heathers','')
  ridgeside_south = Room.new('Corrupted Wilds',[3,7],'Ridgeside South','at the south corner of the ridgeway','')
  carved_pines = Room.new('Corrupted Wilds',[4,5],'Carved Pines','near a collection of carved pines which face the river','')
  scarred_redwood = Room.new('Corrupted Wilds',[4,6],'Scarred Redwood','under a windscarred redwood tree','')
  ridgeside_post = Room.new('Corrupted Wilds',[4,7],'Ridgeside Post','underneath a makeshift watch post build into the ridgeside','')
  pebble_stacks = Room.new('Corrupted Wilds',[5,5],'Pebble Stacks','near a sandy riverside clearing','')
  goblin_fort_ruins_south = Room.new('Corrupted Wilds',[5,6],'Goblin Fort Ruins South','in the south end of a ruined goblin fort','')
  ridgeside_etchings = Room.new('Corrupted Wilds',[5,7],'Ridgeside Etchings','near a patch of etchings in the ridgeside','')
  bridge_signpost = Room.new('Corrupted Wilds',[6,5],'Bridge Signpost','next to a gnarled signpost near the bridge','')
  goblin_fort_ruins_north = Room.new('Corrupted Wilds',[6,6],'Goblin Fort Ruins North','in the north end of the goblin fort','')
  ridgeside_north = Room.new('Corrupted Wilds',[6,7],'Ridgeside North','at the north side of ridgeside','')
  waterfall_underpass = Room.new('Corrupted Wilds',[7,5],'Waterfall Underpass','near a nook in the cliiff','')
  bleached_clearing = Room.new('Corrupted Wilds',[7,6],'Bleached Clearing','in a brightly lit clearing','')
  fractured_cliff = Room.new('Corrupted Wilds',[7,7],'Fractured Cliff','facing a wide crack in the cliff','')
# --

## POPULATE ROOMS WITH LOOT AT RANDOM

ObjectSpace.each_object(Room) do |room|
  room.room_gold = 0
  room.generate_room_loot
  room.items = []
end

## MAKE NAMED ITEMS (name,id,attack,defence,agility,type)

dagger = Item.new("Dagger",:dagger,2,0,1,5,:weapon)
sword = Item.new("Sword",:sword,3,0,-1,7,:weapon)
tunic = Item.new("Tunic",:tunic,0,2,0,3,:armor)
wand = Item.new("Wand",:wand,2,-2,1,10,:weapon)
wand.quip = "Bzzt!"
rusty_dagger = Item.new("Rusty Dagger",:rusty_dagger,1,0,1,2,:weapon)
rusty_dagger.quip = "Slick with goblin sweat."
potion = Item.new("Health Potion",:health_potion,0,0,0,5,:potion)
potion.restore_hp = 8
player.inventory.push(potion)
player.inventory.push(potion)
player.inventory.push(potion)

ObjectSpace.each_object(Room) do |room|
  d15 = rand(1..15)
  if d15 == 15
    room.items.push(wand)
    break
  end
end

## ADD NAMED ITEMS TO ROOMS

secret_cave_entrance.items.push(wand)
goblin_fort_ruins_south.items.push(sword)
secret_cave_entrance.items.push(tunic)

player.active_armor = tunic
player.active_weapon = dagger

## MAKE ENEMIES
##################(hp,level, attack, defence,agility, gold, inventory,active_weapon,name,location,id)
gobbo1a = Enemy.new(3,2,1,1,1,2,[rusty_dagger],rusty_dagger,"Weak Goblin",[1,1],:goblin1)
gobbo1b = Enemy.new(4,1,1,1,1,2,[rusty_dagger],rusty_dagger,"Weak Goblin",$VALID_ROOMS.sample,:goblin1)
gobbo1c = Enemy.new(4,1,1,1,1,2,[rusty_dagger,potion],rusty_dagger,"Weak Goblin",$VALID_ROOMS.sample,:goblin1)
gobbo1d = Enemy.new(4,1,1,1,1,2,[rusty_dagger],rusty_dagger,"Weak Goblin",$VALID_ROOMS.sample,:goblin1)
gobbo1e = Enemy.new(4,1,1,1,1,2,[wand],wand,"Weak Goblin",$VALID_ROOMS.sample,:goblin1)
gobbo2a = Enemy.new(4,2,1,1,1,6,[rusty_dagger,potion],rusty_dagger,"Scraggly Goblin",$VALID_ROOMS.sample,:goblin2)
gobbo2b = Enemy.new(4,2,1,1,1,6,[rusty_dagger],rusty_dagger,"Scraggly Goblin",$VALID_ROOMS.sample,:goblin2)
gobbo3 = Enemy.new(4,3,1,1,1,3,[rusty_dagger],rusty_dagger,"Sly Goblin",$VALID_ROOMS.sample,:goblin3)
gobbo4 = Enemy.new(4,5,2,1,1,3,[rusty_dagger],rusty_dagger,"Tough Goblin",$VALID_ROOMS.sample,:goblin4)
gobbo5 = Enemy.new(4,7,2,1,1,3,[rusty_dagger,potion,potion],rusty_dagger,"Goblin Enforcer",$VALID_ROOMS.sample,:goblin5) # (hp, attack, defence, gold, inventory,name,id)

#--------------END-SETUP--------------#

## CORE GAME METHODS

def get_room_info(player)
  ObjectSpace.each_object(Room) do |room|
    if room.coords == player.current_room
      puts "### #{room.title} ###".upcase
      puts "You are #{room.short_desc}."
    end
  end
    ObjectSpace.each_object(Enemy) do |enemy|
      if player.current_room == enemy.location
        puts "There's a #{enemy.name} lurking here."
      end
  end
end

def get_room_details(player)
  ObjectSpace.each_object(Room) do |room|
    if room.coords == player.current_room
      puts room.long_desc
      sleep(1)
      if room.room_gold > 0
        puts "There's #{room.room_gold} gold here."
      end
      if room.items.empty? == false
        puts "The room contains:"
        room.items.each do |item|
        puts "* #{item.name}"
      end
    end
  end
  end
end

def get_fight(player)
  ObjectSpace.each_object(Enemy) do |enemy|
    if enemy.location == player.current_room
      combat(player,enemy)
    end
  end
end

def get_exp(exp,player)
  next_level = player.level + 1
  player.exp+=exp
  unless player.exp < player.next_level
    player.level_up
  end
end

def combat(player,enemy) # a very simple combat engine for now
  while player.alive? # end when either is dead. TODO: add a real death method
  player.swing(enemy)
  sleep(1)
  break unless enemy.alive?
  enemy.swing(player)
  sleep(1)
  end
  if player.alive? == true
    puts "The #{enemy.name} is dead."
    enemy.location = [0,0]
    player.gold+=enemy.gold
    puts "You get #{enemy.gold} gold from its corpse."
    enemy.inventory.each do |item|
    player.inventory.push(item)
    puts "You loot #{item.name}"
  end
  puts "You get #{enemy.exp_drop} EXP"
  get_exp(enemy.exp_drop,player)
  else
    player.dead("The #{enemy.name} killed you.")
  end
end

## TESTS GO HERE
=begin
while true
get_exp(100,player)
player.status
sleep(1)
end
=end
## CORE GAME LOOP

get_room_info(player)
while true
print "> "
choice = gets.chomp
case choice
when /north/
  player.move_north
  get_room_info(player)
when /south/
  player.move_south
  get_room_info(player)
when /east/
  player.move_east
  get_room_info(player)
when /west/
  player.move_west
  get_room_info(player)
when /get gold/
  player.get_gold(player.current_room)
when /get/
  player.get(choice,player.current_room)
when /inventory/
  player.list_inventory
when /equip/
  player.equip(choice)
when /use/
  player.use(choice)
when /status/
  player.status
when /look/
  get_room_details(player)
when /fight/
  get_fight(player)
end
end

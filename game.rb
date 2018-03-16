$gold = 14
$player_hp = 10
$player_inventory = {}
$shop_inventory = {'Shining Dagger of the Night' => 12, 'Mucky Tunic' => 2, 'Ancient Scarab Brooch' => 9}
$cart_goblin = true

# $shop_inventory.key 12  -- the name of the item that costs 12 gold
# $shop_inventory.fetch 'Shining Dagger of the Night' -- the price of the dagger
# puts $shop_inventory.keys[0] -- the first item in the list
# puts $shop_inventory.values[0] -- the price of the first item in the list

def start(why_start)
    puts "      **VILLAGE**"
    puts why_start # this lets me present a custom opening line when the player returns to the first area
    puts "You're in the middle of a silent town at night."
    puts "You have #{$gold} gold in your pocket."
    if $player_inventory.empty? == false
      puts "You have the following items in your bag: "
      $player_inventory.keys.each do |n| # iterates through the inventory array if there are items in it
        puts "* #{n}\n"
      end
    end

    puts "There's a faint light glowing in the window of the shop."
    puts "Through the village, the road dissolves into a dirt track and leads to a distant forest."
    puts "Where do you go?"
    print "> "
    choice = $stdin.gets.chomp # gets user input

    if choice.include? "shop"
      puts "You enter the village shop."
      puts "An old man is squinting at a tattered tome behind the counter."
      shop # go to the shop
    elsif choice.include? "forest" || "track"
      "You leave the village, the road getting slowly bumpier."
      path # go to the path
    else
      dead("You died of boredom.")
  end
end

def shop
  puts "      **VILLAGE SHOP**"
  puts "Would you like to see what's for sale?"
  print "> "
  choice = $stdin.gets.chomp
  if choice.include? "y" || "yes"
    shop_list # list the shop items
  else
    start("You step out of the shop, into the darkness...") # go back to the village
  end
end

def shop_list

  i=0 # initialize the counter for the shop item list
  $shop_inventory.keys.each do |n|
    i=i+1
    puts "#{i}: #{n}" # iteratively lists out the shop items
  end

  puts "Buy which item?"
  print "> "
  choice = $stdin.gets.chomp # gets choice
  choice = choice.to_i-1 # this has a bug that selects the last item if input is unknown

  if $shop_inventory.values[choice].to_i <= $gold # check if the player can afford the item
    buy_prompt(choice) # runs buy_prompt, passing the item selection
  else
    puts "You can't afford that... It costs #{$shop_inventory.values[choice]} gold and you only have #{$gold}."
    shop
  end
end

def buy_prompt(choice) #  choice = choice.to_i-1 # maps the item selection to the hash
  puts $shop_inventory.keys[choice] + " is " + $shop_inventory.values[choice].to_s + " gold." # "[chosen item] is [X] gold"
  puts "Buy it?"
  print "> "
  buy_choice = $stdin.gets.chomp
  if buy_choice.include? "y" || "yes"
    $player_inventory.store($shop_inventory.keys[choice],$shop_inventory.values[choice]) # add the chosen hash item to player_inventory
    puts $shop_inventory.keys[choice] + " was added to your inventory."
    $gold-=$shop_inventory.values[choice] # bill the player the item cost
    $shop_inventory.delete($shop_inventory.keys[choice]) # delete the item from the shop
    puts "You have #{$gold} gold remaining."
  else
    shop
  end
    if $shop_inventory.empty? # kicks players out of the shop if it has nothing to sell
    start("SOLD OUT! You leave the shop.")
    end
    puts "Buy another item?"
    print "> "
    next_choice = $stdin.gets.chomp
    if next_choice.include? "y" || "yes"
      shop_list
    else
      start("You leave the shop...")
  end
end

def path # this method is nice and clean, the others could do with being as tidy
  puts "      **DIRT PATH**"
  puts "You're heading down the dirt track. You see the moonlit forest ahead."
  puts "A track leads off to your left through a gap in the thicket."
  puts "Go through the gap, to the forest, or back to the village?"
  print "> "
  choice = $stdin.gets.chomp
  if choice.include? "gap"
    gap
  elsif choice.include? "forest"
    forest
  else
    start("You head back down the road towards the village.")
  end
end

def gap
  puts "      **SUSPICIOUS GAP**"
  puts "You silently slip through the gap."
  sleep(1)
  if $cart_goblin == true # check the goblin hasn't been killed already
  puts "You see torchlight."
  puts "A hunched goblin is rummaging through a cart. He didn't seem to hear you."
  puts "Do you go closer, or go back through the gap?"
  print "> "
  choice = $stdin.gets.chomp
  if choice.include? "back" || "gap"
    path
  else
    cart
  end # jump here if the goblin is dead
    puts "You see the abandoned cart and the goblin's body. There's no way forward."
    path
  end
end

def cart
  puts "You approach the cart."
  d20 = rand(1..20) # check sneakiness. this should be modified by an attribute in my next iteration.
  puts "Let's see how sneaky you are..."
  sleep(1)
  puts "You roll #{d20}."
  sleep(1)
  puts "..."
  sleep(1)
  if d20 > 14 # sneakiness test passed
    puts "You sneak up on the goblin..."
    sleep(1)
      goblin_attack_sneak
  else # sneakiness test failed
    puts "You alerted the goblin! Defend yourself!"
    sleep(1)
    goblin_attack_backfoot
  end
end

def goblin_attack_sneak
  if $player_inventory.has_key? "Shining Dagger of the Night" # go here if player is armed
    puts "You slit the goblin's throat."
  else # go here if player is unarmed
    puts "You swiftly snap it's neck without it ever knowing you were there."
  gold_loot = rand(2..5)
  puts "You find #{gold_loot} gold coins in the purse."
  $gold = $gold + gold_loot # add the looted gold to player's stash
  puts "It doesn't look like there's anything left to take. You head back to the path."
  $cart_goblin = false # goblin is classed as dead now
  path
  end
end

def goblin_attack_backfoot
   if !$player_inventory.has_key? "Mucky Tunic" # check if the player has armor
     damage_string_end = " -- should've worn some kind of armor"
     damage = rand(2..4) # deal d4 damage to unarmored player
  else
     damage = rand(1..2) # deal d2 damage to armored player
  end
  if $player_inventory.has_key? "Shining Dagger of the Night" # check if the player is armed
    attack_string_end = "stabbing it lethally with your shining dagger."
  else
    attack_string_end = "snapping its neck with your bare hands. Arm yourself next time..."
  end
  puts "The goblin slices you for #{damage}#{damage_string_end}."
  $player_hp = $player_hp - damage # take damage!
  sleep(1)
  puts "You have #{$player_hp} health remaining"
  sleep(1)
  puts "You hit back at the goblin, #{attack_string_end}."
  $cart_goblin = false # sets the goblin as permanently dead
  sleep(1)
  gold_loot = rand(2..5)
  puts "You find #{gold_loot} gold coins in the purse"
  $gold = $gold + gold_loot # add loot to player stash
  sleep(1)
  box_loot = rand(1..2) # 50/50 chance of looting a cupcake from the cart
  if box_loot == 1
    puts "You found an iced cupcake in the cart. You bundle it into your dusty bag."
    $player_inventory.store("Dusty iced cupcake",1) # add the item to inventory hash with gold value 1
  end
  sleep(1)
    puts "It doesn't look like there's anything left to take. You head back to the path."
    sleep(1)
    path
end

def forest # TBC!
  puts 'A ghostly voice echoes: "OooOoo...Unfortunately, I haven\'t built this part of the game yet...'
  sleep(3)
  path
end

def dead(why_dead)
  puts why_dead
  exit(0)
end

start("You're beginning your journey...")

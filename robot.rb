############## PLACING ##############
allowed_coordinates = [0, 1, 2, 3, 4]

p "x-coordinate?"
# start_position = [0,0]
x = gets.chomp.to_i
unless allowed_coordinates.include?(x)
  puts "Please input an integer between 0 to 4"
  x = gets.chomp.to_i
end
# input example PLACE 0,0,NORTH
# so input takes in 3 arguments, x-axis, y-axis, direction
# (0,1,NORTH)
p "y-coordinate?"
y = gets.chomp.to_i
unless allowed_coordinates.include?(y)
  puts "Please input an integer between 0 to 4"
  y = gets.chomp.to_i
end

p "facing?"

face = gets.chomp

robot_position = [x,y,face]
p robot_position
puts
# table = [
#   [[0,0],[0,1],[0,2],[0,3],[0,4]],
#   [[1,0],[1,1],[1,2],[1,3],[1,4]],
#   [[2,0],[2,1],[2,2],[2,3],[2,4]],
#   [[3,0],[3,1],[3,2],[3,3],[3,4]],
#   [[4,0],[4,1],[4,2],[4,3],[4,4]]
# ]

# table[x][y] = "Robot"
# table.each do |row|
#   p row
# end


# p "Robot has been placed on the table, location:#{table[x][y]} facing #{face}"

# ############## MOVING ################

# direction = ["north", "south", "east", "west"]

def move position
  # if robot is at 0,0 it cannot move any more to the west or south robot_position
  # if robot is at 4,4 it shouldn't be able to move anymore to the east ot north

  if position[2] == "north"
    if position[1] >= 4
     puts "Sorry, you are at the edge, rotate!"
    else
      # if direction north move up => increase y by 1?
      position[1]+= 1
    end

  elsif position[2] == "south"
    if position[1] <= 0
      puts "Sorry, you are at the edge, rotate!"
    else
      position[1] -= 1 
    end

  elsif position[2] == "east"
    if position[0] >= 4
      puts "Sorry, you are at the edge, rotate!"
    else
      position[0] += 1 
    end

  elsif position[2] == "west"
    # if direction west move right => increase x by 1?
    if position[0] <= 0
      puts "Sorry, you are at the edge, rotate!"
    else
      position[0] -= 1 
    end
  end
  "Robot's current position: #{position[0]},#{position[1]} facing #{position[2]}"
end

############## ROTATE , left/ right###############

def right position
  # if currently facing north
  if position[2] == "north"
    # right will make it face east
    position[2] = "east"
  # if currently facing south
  elsif position[2] == "south"
    #  right will make it face west
    position[2] = "west"
  # if currently facing east
  elsif position[2] == "east"
    # right will make it face south
    position[2] = "south"
  # if currently facing west
  elsif position[2] == "west"
    # right will make it face north
    position[2] = "north"
  end
  position
end

def left position
  # if currently facing north
  if position[2] == "north"
    # left will make it face west, 
    position[2] = "west"
  # if currently facing south
  elsif position[2] == "south"
    # left will make it face east,
    position[2] = "east"
  # if currently facing east
  elsif position[2] == "east"
   # left will make it face north, 
   position[2] = "north"
  # if currently facing west
  elsif position[2] == "west"
    # left will make it face south, 
    position[2] = "south"
  end
  position
end

p "what is your move?"
input = gets.chomp

while input != "quit"
  if input == "move"
   p move(robot_position)
  elsif input == "left"
   p left(robot_position)
  elsif input =="right"
  p  right(robot_position)
  else
    puts "Wrong input"
  end
  p "what is your next move?"
  input = gets.chomp
# robot_position
end



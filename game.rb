require_relative 'ui'

def readMap(number)
    arquive = "maps/map#{number}.txt" 

  if File.exist?(arquive)
    text = File.read(arquive)
    map = text.split("\n")
  else
    puts "Arquivo não encontrado: #{arquive}"
    # Você pode lançar uma exceção aqui ou lidar com o erro de outra forma
  end
end

def findHero(map)
  hero = "H"
  map.each_with_index do |line, i|
    heroPos = line.index hero
      if heroPos != nil
        #puts "The hero is in line #{i} and col #{heroPos}"
        return [i, heroPos]
      end

  end
end

def calculatePos(pos, direction)
  # Create a copy of the position to avoid modifying the original
  new_pos = pos.dup

  # Validate direction using a set for fast membership check
  valid_directions = %w[w s a d]
  return new_pos unless valid_directions.include?(direction)

  # Retrieve movement vector efficiently using a hash lookup
  movement = {
    "w" => [-1, 0],
    "s" => [1, 0],
    "a" => [0, -1],
    "d" => [0, 1]
  }[direction]

  # Apply movement vector to update new position
  new_pos[0] += movement[0]
  new_pos[1] += movement[1]

  return new_pos
end

def play(name)
  map = readMap 1
  while true
    writeMap map
    direction = move
    hero = findHero map
    newHeroPos = calculatePos(hero, direction)
    if !isValidPos(newHeroPos, map)
      next
    end
    #render hero
    map[hero[0]][hero[1]] = " "  
    hero = [newHeroPos[0],newHeroPos[1]]
    map[hero[0]][hero[1]] = "H"   
  end
end

def isValidPos(pos, map) 
  return (pos[0] >= 0 && pos[0] < map.size && pos[1]>= 0 && pos[1]< map[0].size) && map[pos[0]][pos[1]] != "X"
end


def init_game
  name= welcome
  play(name)
end

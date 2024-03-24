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

def calculatePos(pos, direction, map)
  newPos = [pos[0],pos[1]]
  case direction
    when "w"      
      newPos[0]-= 1  
    when "s"
      newPos[0]+= 1
    when "a"
      newPos[1]-= 1
    when "d"
      newPos[1]+= 1
  end
  return newPos
end

def play(name)
  map = readMap 1
  while true
    writeMap map
    direction = move
    hero = findHero map
    newHeroPos = calculatePos(hero, direction, map)
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

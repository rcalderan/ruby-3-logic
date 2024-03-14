require_relative 'ui'

def readMap(number)
    arquive = "map#{number}.txt" #/maps/map#{number}.txt <- not working on VScode, must set the complete path or configure it


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

def play(name)
  map = readMap 1
  while true
    writeMap map
    direction = move
    hero = findHero map
    map[hero[0]][hero[1]] = " "
    case direction
        when "w"
          hero[0]-= 1
        when "s"
          hero[0]+= 1
        when "a"
          hero[1]-= 1
        when "d"
          hero[1]+= 1
    end
    map[hero[0]][hero[1]] = "H"
  end

end

def renderHero

end

def init_game
  name= welcome
  play(name)
end

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

def play(name)
  map = readMap 1
  while true
    writeMap map
    move
  end

end

def init_game
  name= welcome
  play(name)
end

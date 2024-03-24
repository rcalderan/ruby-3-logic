# Importa as bibliotecas
require 'csv'
require 'json'

def testFor
  size = 5
  (0..size).each do |line|
    puts line
  end
end

def testFor2
  size = (0..5)
  size.each do |line|
    puts line
  end
end

def testArrayMethods
  fruits = ['aple', 'pinaple', 'banana', 'orange']

  fruits.map do |fruit| #should print all fruit
    puts fruit
  end

  puts fruits.map { |fruit| fruit.size < 5 ? fruit : ''
} #should return aple

end

def read
  text = File.read("maps/map1.txt")
  map = text.split("\n")
  puts text.lines[1][12]
end

read

def readCsvCrude
  csv = File.read("maps/teste.csv")
  headers = csv.lines[0].split(",")
  rows =[]
  # i=1
  (1..csv.count("\n")-1).each do |i|
    rows[i] =  csv.lines[i].split(",")
    
    # rows[i] =line.split(",")
    # i+=1
  end
  puts rows
  
  # puts rows
  
end

def readCsv
  csvData = CSV.read('maps/teste.csv', headers: true)
  #puts csvData.class

  jsonData = { persons: []}
  puts jsonData
  jsonData.persons << "2"
  puts jsonData
  csvData.each do |row|
    person = {}
    row.each do |key, value|
      #puts "Key #{key}; Value:#{value}"
      person[key] = value
    end
    #puts person['hobbies']
    #jsonData['persons'] << person
    # if person != nil
    #   jsonData['persons'] << person
      
    # end
  end

  #File.write('test.json', JSON.pretty_generate(json_data))
end

readCsv

#testArrayMethods

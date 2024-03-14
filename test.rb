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

testArrayMethods

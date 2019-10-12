categories = [
  'Booty & Abs',
  'Full Body',
  'Advertising',
  'Writing',
  'Singing',
  'Music Fundamentals'
]
category_index = 0

['Health & Fitness', 'Business', 'Music'].each do |vertical|
  vertical = Vertical.new(name: vertical)
  if vertical.valid?
    vertical.save

    2.times.each do |i|
      Category.create(name: categories[category_index+i], vertical: vertical)
    end
    category_index += 2
  end
end


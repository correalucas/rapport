50.times do
  Member.create(name: Faker::Name.name, original_url: "https://www.google.com/search?q=#{Faker::Creature::Animal.name}")
end

50.times do
  Member.create(name: Faker::Name.name, original_url: "https://www.google.com/search?q=#{Faker::Creature::Animal.name}")
end

500.times do
  member_id = Member.pluck(:id).sample
  friend_id = Member.pluck(:id).sample
  Friendship.create(member_id: member_id, friend_id: friend_id)
  Friendship.create(member_id: friend_id, friend_id: member_id)
end
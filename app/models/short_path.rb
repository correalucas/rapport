class ShortPath
  def self.get_path(from, to)
    @original_from = from
    @visited = [from]
    @i = 0
    @a = []
    @path = {}
    find_friend(from, to)
    @path.min_by { |_, v| v.size }[1] if @path.any?
  end

  def self.find_friend(from, to)
    if from.friendships.any? { |f| f.friend_id == to.id }
      @a.unshift(@original_from.id)
      @a.push(to.id)

      @path[@i] = @a
      @a = []
      @i += 1
    else
      @visited.push(from.id)
      from.friendships.each do |friendship|
        next if @visited.include?(friendship.friend_id) || (@a == [] && from != @original_from)
        @a.push(friendship.friend_id)
        find_friend(friendship.friend, to)
      end
    end
  end
end

class Member < ApplicationRecord
  API_URL = 'https://api-ssl.bitly.com'

  validates :name, :original_url, presence: true
  validates :original_url, :short_url, url: true, allow_nil: true

  before_validation :retrieve_short_url
  after_create :store_headings

  has_many :friendships
  has_many :friends, class_name: :Member, through: :friendships

  def first_name
    name.split(' ').first
  end

  def not_friend_yet(member_id)
    friendships.none? { |f| f.friend_id == member_id }
  end

  private

  def retrieve_short_url
    response = JSON.parse(RestClient.get("#{API_URL}/v3/shorten?access_token=#{BITLY_TOKEN}&longUrl=#{original_url}"))
    if response['status_code'] != 200
      errors.add(:short_url, "is invalid. Error: #{response['status_txt']}")
      return false
    end
    self.short_url = response['data']['url']
  end

  def store_headings
    StoreHeadingsJob.perform_later(id)
  end
end

class Member < ApplicationRecord
  API_URL = 'https://api-ssl.bitly.com'

  validates :name, :original_url, presence: true
  validates :original_url, :short_url, url: true, allow_nil: true

  before_validation :retrieve_short_url

  private

  def retrieve_short_url
    response = JSON.parse(RestClient.get("#{API_URL}/v3/shorten?access_token=#{BITLY_TOKEN}&longUrl=#{original_url}"))
    if response['status_code'] != 200
      errors.add(:short_url, "is invalid. Error: #{response['status_txt']}")
      return false
    end
    self.short_url = response['data']['url']
  end
end

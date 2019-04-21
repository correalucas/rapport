class Member < ApplicationRecord
  validates :name, :original_url, presence: true
  validates :original_url, :short_url, url: true, allow_nil: true
end

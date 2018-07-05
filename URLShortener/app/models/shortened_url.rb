# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint(8)        not null, primary key
#  long_url   :string
#  short_url  :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'byebug'
class ShortenedUrl < ApplicationRecord
  # debugger
  validates :long_url, :short_url, presence:true, uniqueness: true 
  validates :user_id, presence: true
  
  def self.random_code
    short = SecureRandom.urlsafe_base64
    # debugger
    while ShortenedUrl.exists?(short_url: short)
      short = SecureRandom.urlsafe_base64
    end
    short
  end
  
  def self.create_url(user_id, long_url)
    # debugger
    ShortenedUrl.new(short_url: ShortenedUrl.random_code, user_id: user_id, long_url: long_url)
  end
  
  belongs_to :submitter,
    primary_key: :id, 
    foreign_key: :user_id, 
    class_name: :User
  
  has_many :visitors,
    primary_key: :id,
    foreign_key: :short_url,
    class_name: :Visit
  
  def num_clicks
    self.visitors.length
  end
  
  
end

require 'byebug'
# == Schema Information
#
# Table name: visits
#
#  id         :bigint(8)        not null, primary key
#  short_url  :integer
#  user       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Visit < ApplicationRecord
  validates :user_id, :short_url_id, presence: true 
  
  def self.record_visit!(user_id, shortened_url)
    # debugger
    Visit.new(user_id: user_id, short_url_id: shortened_url)
  end
    
  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  
  belongs_to :shortened_url,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :ShortenedUrl
end 

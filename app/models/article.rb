class Article < ActiveRecord::Base
  
  belongs_to :user

  validates :title,presence: true,length: {minimum:3,maximum:150}
  validates :description,presence: true,length: {minimum:30}
  validates :user_id,presence:true
  scope :latest ,lambda {order("updated_at DESC limit 2")}
end
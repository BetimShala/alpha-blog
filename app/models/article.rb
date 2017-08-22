class Article < ActiveRecord::Base
  validates :title,presence: true,length: {minimum:3,maximum:150}
  validates :description,presence: true,length: {minimum:30}

  scope :latest ,lambda {order("updated_at DESC limit 2")}
end
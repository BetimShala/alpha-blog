class Comment < ActiveRecord::Base
  belongs_to :user,optional: true
  belongs_to :article
end

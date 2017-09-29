class User < ActiveRecord::Base

  has_many :articles ,dependent: :destroy # qikjo dependent destory dmth qe useri i caktum i ka artikujt e tij te caktuar
                                          # perderisa destroy aksioni nuk eshte performuar , ne momentin qe performohet
                                          # aksioni i tille ateher te gjithe artikujt e tij do fshihen nga tabela
                                          # articles
  has_secure_password
  has_many :likes
  #active_relationships dmth ata qe ne i bejme follow
  has_many :active_relationships,class_name: "Relationship",foreign_key: "follower_id",dependent: :destroy
  #passive_relationships dmth ata qe na kan bere neve follow
  has_many :passive_relationships,class_name: "Relationship",foreign_key: "followed_id",dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :comments
  #notifications
  has_many :notifications

  #po deshirojme qe te gjitha email ne db me u rujt
  #ne shkronja te vogla,kete gje e arrijme me ane te
  # metodes before_save{}
  before_save {self.email =email.downcase}


  validates :username,presence: true,
                      uniqueness: {case_sensitive: false} ,
                      length:{minimum:3,maximum:25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email ,  presence: true,
                      length: {maximum:105},
                      uniqueness: {case_sensitive: false},
                      format: {with: VALID_EMAIL_REGEX}
end

class User < ActiveRecord::Base

  has_many :articles ,dependent: :destroy # qikjo dependent destory dmth qe useri i caktum i ka artikujt e tij te caktuar
                                          # perderisa destroy aksioni nuk eshte performuar , ne momentin qe performohet
                                          # aksioni i tille ateher te gjithe artikujt e tij do fshihen nga tabela
                                          # articles
  has_secure_password
  has_many :likes
  has_many :friendships

  has_many :comments
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

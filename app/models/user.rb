class User < ApplicationRecord
  has_many :ideas
  VALID_NAME_REGEX = /\A[a-zA-Z]+\z/i
  validates :name, presence: true, length: { minimum: 3},
                                   uniqueness:  { case_sensitive: false },
                                   format: { with: VALID_NAME_REGEX }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  def User.digest(string) #return the hash digest
  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                BCrypt::Engine.cost
  BCrypt::Password.create(string, cost: cost)
  end
  
end

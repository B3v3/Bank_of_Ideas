class Idea < ApplicationRecord

  belongs_to :user

  validates :title, presence: true, length: { maximum: 55 },
                                    uniqueness: { case_sensitive: false }
  validates :body, presence: true
  
end

class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :answers, presence: true

end

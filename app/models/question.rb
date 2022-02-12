class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  #validates :answers, presence: true
  validates :body, presence: true


  def right_answers
     self.answers.correct
   end
end

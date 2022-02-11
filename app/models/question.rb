class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  #has_many :current_questions
  #validates :answers, presence: true
  validates :body, presence: true


  def right_answers
    self.answers.correct
  end
end

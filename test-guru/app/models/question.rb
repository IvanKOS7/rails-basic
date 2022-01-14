class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :answers, presence: true
  validate :right_answers_count

  private

    def right_answers_count
       errors.add(:answers) if self.answers.count >= 4 || < 1
    end

end

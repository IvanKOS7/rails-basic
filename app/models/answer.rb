class Answer < ApplicationRecord
  belongs_to :question

  validates :question_id, presence: true
  #validate :right_answers_count, on: :create


  scope :correct, -> { where(correct: true) }
  private

    def right_answers_count
      errors.add(:answer, "The number of answers cannot be more than 4. Answers full.") if self.question.answers.count >= 4
    end

end

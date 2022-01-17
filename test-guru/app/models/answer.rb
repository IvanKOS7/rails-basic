class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answer, -> { where(correct: true) }
  validates :question_id, presence: true
  validate :right_answers_count, on: :create

  private

     def right_answers_count
        errors.add(:answer, "The number of answers cannot be more than 4. Answers full.") if Answer.where("question_id= ?", self.question_id).count >= 4
     end

end

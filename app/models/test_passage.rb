class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  before_validation :set_question

  PASSED_PERCENT = 85.freeze

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
        self.correct_questions += 1
    end
    save!
  end

  def answer_choosed?(answer_ids)
    !answer_ids.nil?
  end

  def completed?
    current_question.nil?
  end

  def correct_answer?(answer_ids)
    if answer_ids != nil
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    end
  end

  def correct_answers
    current_question.answers.correct
  end

  def questions_counter
    @count = self.test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def percent
    self.correct_questions.fdiv(self.test.questions.count) * 100
  end

  def test_passed?
    self.percent >= PASSED_PERCENT
  end

  def dead_line
    (self.created_at + self.test.timer_value).utc.iso8601 if self.test.timer_value
  end

  def time_is_over?
    self.dead_line < Time.now
  end


  private

  def before_validation_set_first_question
    self.current_question = test.questions.order(:id).first if test.present?
  end

  def next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def set_question
    if self.completed?
      before_validation_set_first_question
    else
      next_question
    end
  end

end

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
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
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

  def test_passed_on_the_first_try?
    self.test_passed? && !self.user.test_passages.where(:test_id => test.id).many?
  end

  def all_tests_passed_with_category?
    self.test_passed? && self.user.test_passages.where(test_passed: true).map(&:test_id).uniq ==  Category.find(self.test.category_id).tests.ids
  end

  def all_tests_passed_with_level?
    self.test_passed? && self.user.test_passages.where(test_passed: true, test_id: Test.where(level: self.test.level)).map(&:test_id).uniq ==  Test.where(level: self.test.level).ids
  end

  def select_badge_attributes
    badges ||= []
    if self.test_passed_on_the_first_try?
      badges.push(Badge.where(badge_type: "first_try"))
    end

    if self.all_tests_passed_with_level?
      badges <<  Badge.where(badge_type: "level_passed")
    end

    if self.all_tests_passed_with_category?
      badges.push(Badge.where(badge_type: "category_passed"))
    end
    self.user.badges << badges
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

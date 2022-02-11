class User < ApplicationRecord
  #has_and_belongs_to_many :tests
  has_many :test_passages
  has_many :tests, through: :test_passages
  validates :name, :email, presence: true

  def find_user_tests_by_level(level)
    pp tests.find_by("tests.level = ?", level)
  end

  # def run_test
  #   tests << Test.all.first
  # end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end

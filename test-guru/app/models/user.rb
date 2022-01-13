class User < ApplicationRecord
  has_and_belongs_to_many :tests

  def find_user_tests_by_level(level)
    pp tests.find_by("tests.level = ?", level)
  end

  def run_test
    tests << Test.all.first
  end
end

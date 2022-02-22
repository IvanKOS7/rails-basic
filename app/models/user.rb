#require 'digest/sha1'

class User < ApplicationRecord


  validates :email, format: { with:  URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  #include Auth

  has_many :test_passages
  has_many :tests, through: :test_passages

  has_secure_password

  def find_user_tests_by_level(level)
    pp tests.find_by("tests.level = ?", level)
  end

  def test_passage(test)
     test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end

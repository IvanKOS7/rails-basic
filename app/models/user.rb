#require 'digest/sha1'

class User < ApplicationRecord

  EMAIL_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze
  validates :email, format: { with: EMAIL_REGEXP }
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



class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test"
  has_many :gists, dependent: :destroy

  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges, dependent: :destroy

  def find_user_tests_by_level(level)
    pp tests.find_by("tests.level = ?", level)
  end

  def test_passage(test)
     test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.is_a?(Admin)
  end
end

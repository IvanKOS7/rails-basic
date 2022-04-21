class Badge < ApplicationRecord
  BADGE_TYPES = ["first_try", "level", "category"]

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges, dependent: :destroy

  validates :badge_type, presence: true
  validates :type_param, presence: true, uniqueness: true
end

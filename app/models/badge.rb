class Badge < ApplicationRecord
  BADGE_TYPES = ["first_try", "level_passed", "category_passed"]

  has_many :user_badges
  has_many :users, through: :user_badges

end

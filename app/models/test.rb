class Test < ApplicationRecord
  belongs_to :category
  has_many :test_passages, dependent: :delete_all
  has_many :users, through: :test_passages
  has_many :questions

  validates :title, presence: true, uniqueness: {scope: :level}
  validates :level, numericality: { greater_than_or_equal_to: 0 }

#\A[+]?\d+\z - regexp
  def self.tests_categories_sort(category_name)
    all_test_with_category.order(title: :desc).where("categories.title like ? ", category_name).pluck(:title)
  end


  scope :simple_level, -> { where(level: 0..1) }
  scope :midle_level,  -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }
  scope :all_test_with_category, -> { Test.joins(:category) }

end

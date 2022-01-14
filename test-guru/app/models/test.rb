class Test < ApplicationRecord
  belongs_to :category, optional: true
  has_and_belongs_to_many :users
  has_many :questions
  validates :title, presence: true, uniqueness: true
  validates :level, numericality: { greater_than_or_equal_to: 0 }, uniqueness: true
#\A[+]?\d+\z - regexp
  def self.test_sort(category_name)
    Test.order(title: :desc).joins(:category).where("categories.title like ? ", category_name).pluck(:title)
  end

  scope :simple_level, -> { where(level: 0..1) }
  scope :midle_level,  -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }

  #test sorting by category name
  scope :sort_test, -> (category_name) { order(title: :desc).joins(:category).where("categories.title like ? ", category_name).pluck(:title) }
end

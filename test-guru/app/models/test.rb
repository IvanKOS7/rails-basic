class Test < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users

  def self.test_sort(category_name)
    Test.order(title: :desc).joins(:category).where("categories.title like ? ", category_name).pluck(:title)
  end
end

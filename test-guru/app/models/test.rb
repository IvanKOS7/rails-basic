class Test < ApplicationRecord

  def self.test_sort(category_name)
    cat_id = Category.find_by("title = ?", category_name).id
    Test.order(title: :desc).select(:title).where("category_id = ?", cat_id)
  end
end

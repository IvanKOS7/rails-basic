class AddAuthorAttributeToTests < ActiveRecord::Migration[6.1]
  def change
    add_reference(:tests, :user, index: { name: "author_id" })
  end

end

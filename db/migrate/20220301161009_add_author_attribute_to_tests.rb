class AddAuthorAttributeToTests < ActiveRecord::Migration[6.1]
  def change
    add_reference(:tests, :admin, index: { name: "author" })
  end

end

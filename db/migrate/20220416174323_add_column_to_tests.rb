class AddColumnToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :timer_value, :integer
  end
end

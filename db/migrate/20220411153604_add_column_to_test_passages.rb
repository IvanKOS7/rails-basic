class AddColumnToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :test_passed, :boolean, default: true
  end
end

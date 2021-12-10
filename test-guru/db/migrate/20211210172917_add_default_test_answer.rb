class AddDefaultTestAnswer < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:tests, :title, 'Unknown test')
    change_column_default(:tests, :level, 0)
    change_column_default(:answers, :correct, 'Yes')
  end
end

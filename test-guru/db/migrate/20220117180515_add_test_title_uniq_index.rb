class AddTestTitleUniqIndex < ActiveRecord::Migration[6.1]
  def change
    change_table :tests do |t|
      t.index :title, unique: true
    end
  end
end

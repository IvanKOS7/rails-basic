class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, unique: true
      t.string :full_url
      t.string :color
      t.string :label
      t.string :message
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end

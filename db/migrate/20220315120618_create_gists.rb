class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.string :url, unique: true, default: "Undefined"
      t.belongs_to :question, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end

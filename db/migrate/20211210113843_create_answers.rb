class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.boolean :correct
      t.string :answer
      t.belongs_to :question, foreign_key: true

      t.timestamps
    end
  end
end

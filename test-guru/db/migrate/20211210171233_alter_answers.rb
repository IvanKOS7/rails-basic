class AlterAnswers < ActiveRecord::Migration[6.1]
  def change
    rename_column(:answers, :body, :correct)
  end
end

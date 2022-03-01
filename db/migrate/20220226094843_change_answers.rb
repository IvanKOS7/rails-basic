class ChangeAnswers < ActiveRecord::Migration[6.1]
  def change
    rename_column(:answers, :answer, :body)
  end
end

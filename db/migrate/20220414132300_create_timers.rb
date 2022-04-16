class CreateTimers < ActiveRecord::Migration[6.1]
  def change
    create_table :timers do |t|
      t.string :timer_value
      t.belongs_to :test, foreign_key: true
      t.timestamps
    end
  end
end

class CreateUserTestJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :user_tests, id: false do |t|
      t.bigint :test_id
      t.bigint :user_id
  end

    add_index :user_tests, :test_id
    add_index :user_tests, :user_id
  end
end

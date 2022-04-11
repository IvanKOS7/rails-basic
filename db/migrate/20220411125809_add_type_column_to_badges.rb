class AddTypeColumnToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :badge_type, :string
  end
end

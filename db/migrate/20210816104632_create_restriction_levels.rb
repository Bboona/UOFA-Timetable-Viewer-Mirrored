class CreateRestrictionLevels < ActiveRecord::Migration[6.1]
  def change
    create_table :restriction_levels do |t|
      t.integer :level_current
      t.string :level_name
      t.timestamps
    end
  end
end

class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.text :class_name
      t.string :class_code
      t.text :colour
      t.text :description
      t.text :weeks
      t.text :days
      t.text :hours

      t.timestamps
    end
  end
end

class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.text :class_name
      t.string :class_code
      t.text :colour
      t.text :subject
      t.text :term
      t.text :weeks
      t.text :days
      t.text :hours
      t.text :location
      t.text :size
      t.text :available
      t.text :class_nbr
      t.text :class_type
      t.timestamps
    end
  end
end

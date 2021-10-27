class CreateActivitiesTeachers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :activities, :teachers do |t|
      t.index :activity_id
      t.string :uni_id
    end
  end
end

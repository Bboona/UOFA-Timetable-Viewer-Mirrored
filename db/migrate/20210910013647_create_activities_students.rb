class CreateActivitiesStudents < ActiveRecord::Migration[6.1]
  def change
    create_join_table :activities, :students do |t|
      t.index :activity_id
      t.text :uni_id
    end
  end
end

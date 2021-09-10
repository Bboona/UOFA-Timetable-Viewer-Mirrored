class CreateActivitiesStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :activities_students do |t|

      t.timestamps
    end
  end
end

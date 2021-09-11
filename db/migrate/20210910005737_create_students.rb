class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.text :student_id
      t.text :first_name
      t.text :last_name
      t.text :password
      t.timestamps
    end
  end
end

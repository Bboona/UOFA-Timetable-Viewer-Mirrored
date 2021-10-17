class RemovePasswordFromTeacher < ActiveRecord::Migration[6.1]
  def change
    remove_column :teachers, :password, :text
  end
end

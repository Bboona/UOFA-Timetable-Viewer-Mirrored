class RemovePasswordFromStudents < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :password, :text
  end
end

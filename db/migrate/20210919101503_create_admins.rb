class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.text :uni_id
      t.text :first_name
      t.text :last_name
      t.text :password

      t.timestamps
    end
  end
end

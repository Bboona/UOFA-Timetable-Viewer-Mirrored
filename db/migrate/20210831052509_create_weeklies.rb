class CreateWeeklies < ActiveRecord::Migration[6.1]
  def change
    create_table :weeklies do |t|
      t.text :week

      t.timestamps
    end
  end
end

class AddHammingWeightToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :Hamming_Weight, :text
  end
end

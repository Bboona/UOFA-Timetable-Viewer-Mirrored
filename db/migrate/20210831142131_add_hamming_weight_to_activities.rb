class AddHammingWeightToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :hamming_weight, :text
  end
end

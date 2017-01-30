class AddActiveToBids < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :active, :boolean, default: true
  end
end

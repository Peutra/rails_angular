class AddStartValueToBids < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :start_value, :integer
  end
end

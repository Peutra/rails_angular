class AddBidBatchToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :bid_batch, :integer, default: 0
  end
end

class AddStartValueMaxValueEndBidDateToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :start_value, :integer
    add_column :products, :max_value, :integer
    add_column :products, :end_bid_date, :datetime    
    remove_column :products, :value
  end
end

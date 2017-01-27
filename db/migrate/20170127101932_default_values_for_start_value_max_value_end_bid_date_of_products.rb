class DefaultValuesForStartValueMaxValueEndBidDateOfProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :start_value, :integer, :default => nil
    change_column :products, :max_value, :integer, :default => nil
    change_column :products, :end_bid_date, :datetime, :default => nil
  end
end

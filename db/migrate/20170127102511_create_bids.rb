class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :auto, default: false
      t.integer :increment_by, default: 0
      t.integer :max_value, default: 0
      t.datetime :end_auto_date, default: nil
      t.integer :value

      t.timestamps
    end
  end
end

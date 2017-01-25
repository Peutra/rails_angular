class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.string :rateable_type
      t.integer :rateable_id
      t.integer :value
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

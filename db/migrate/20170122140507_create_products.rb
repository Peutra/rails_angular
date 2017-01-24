class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.string :picture
      t.float :value
      t.boolean :for_sale
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

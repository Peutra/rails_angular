class ChangePictureToPictureUrlFromProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :picture, :picture_url
  end
end

class AddCommentToRating < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :comment, :text, :default => nil
  end
end

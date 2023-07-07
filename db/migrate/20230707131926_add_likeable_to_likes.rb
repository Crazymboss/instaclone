class AddLikeableToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :likeable, polymorphic: true, index: true
    remove_column :likes, :post_id
    add_column :likes, :id, :primary_key
    add_index :likes, :id, unique: true
  end
end

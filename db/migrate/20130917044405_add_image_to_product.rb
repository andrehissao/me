class AddImageToProduct < ActiveRecord::Migration
  def up
    add_attachment :products, :image
  end

  def down
    remove_attachment :products, :image
  end
end

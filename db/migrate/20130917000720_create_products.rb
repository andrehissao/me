class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end

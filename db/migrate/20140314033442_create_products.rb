class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :img_url
      t.decimal :price

      t.timestamps
    end
  end
end

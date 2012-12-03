class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :state
      t.text :description
      t.decimal :price
      t.integer :lon
      t.integer :lat

      t.timestamps
    end
  end
end

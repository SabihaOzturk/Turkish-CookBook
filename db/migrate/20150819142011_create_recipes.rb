class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :ingredients
      t.text :instructions

      t.timestamps null: false
    end
  end
  def self.down
    drop_table :recipes
  end
end
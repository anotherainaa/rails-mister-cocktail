class CreateCocktails < ActiveRecord::Migration[5.0]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.references :ingredient
      t.references :dose

      t.timestamps
    end
  end
end

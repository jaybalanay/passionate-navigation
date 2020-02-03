class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.references :vertical
      t.string :name
      t.string :state

      t.timestamps
    end
  end
end

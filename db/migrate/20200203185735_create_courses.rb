class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.references :category
      t.string :name
      t.string :author
      t.string :state

      t.timestamps
    end
  end
end

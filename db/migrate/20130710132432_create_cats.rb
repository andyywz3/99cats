class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.date :birthday
      t.string :color
      t.string :sex
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end

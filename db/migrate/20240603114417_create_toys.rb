class CreateToys < ActiveRecord::Migration[7.1]
  def change
    create_table :toys do |t|
      t.string :name
      t.string :material
      t.integer :value
      t.string :type

      t.timestamps
    end
  end
end

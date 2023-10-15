class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :movie
      t.string :recommend
      t.text :story
      t.integer :year
      t.string :amazon

      t.timestamps
    end
  end
end

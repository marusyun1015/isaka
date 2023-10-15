class CreatePerfumes < ActiveRecord::Migration[6.1]
  def change
    create_table :perfumes do |t|
      t.string :perfume
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreateWants < ActiveRecord::Migration[6.1]
  def change
    create_table :wants do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

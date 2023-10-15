class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.string :number
      t.integer :user_id

      t.timestamps
    end
  end
end

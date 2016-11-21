class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :place
      t.datetime :date
      t.integer :upper_num
      t.integer :lower_num

      t.timestamps null: false
    end
  end
end

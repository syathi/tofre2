class CreateRefrigerators < ActiveRecord::Migration
  def change
    create_table :refrigerators do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :event, index: true, foreign_key: true
      t.text :name
      t.integer :quantity
      t.date :deadline
      t.date :purchase
      t.integer :release, default: 0
      t.datetime :change

      t.timestamps null: false
    end
  end
end

class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.belongs_to :refrigerator, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :event, index: true, foreign_key: true

      t.boolean :delete_flag, default: false, null: false

      t.timestamps null: false
    end
  end
end

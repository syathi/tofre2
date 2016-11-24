class CreateFabs < ActiveRecord::Migration
  def change
    create_table :fabs do |t|
      t.references :user, null: false #外部キー
      t.references :donut, null: false #外部キー

      t.timestamps null: false
    end
  end
end

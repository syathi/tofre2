class CreateDonuts < ActiveRecord::Migration
  def change
    create_table :donuts do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.text :title
      t.text :material
      t.binary :data #画像データ
      t.string :content_type #MIMEタイプ

      t.timestamps null: false
    end
  end
end

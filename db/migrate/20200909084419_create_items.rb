class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title, default: "", null: false
      t.text :content
      t.integer :price ,null: false
      t.integer :category_id
      t.integer :status_id
      t.integer :burden_id
      t.integer :area_id
      t.integer :day_id
      t.references :user, foreign_key: true
      t.boolean :checked
      t.timestamps
    end
  end
end

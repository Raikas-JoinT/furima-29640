class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title, default: "", null: false
      t.text :content
      t.integer :price
      t.integer :category
      t.integer :status
      t.integer :burden
      t.integer :area
      t.integer :day
      t.references :user, foreign_key: true
      t.boolean :checked
      t.timestamps
    end
  end
end

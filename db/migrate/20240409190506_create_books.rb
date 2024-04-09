class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year_published
      t.string :isbn
      t.decimal :price
      t.references :author, null: false, foreign_key: true
      t.boolean :available, default: true

      t.timestamps
    end

    add_index :books, :title
    add_index :books, [:title, :author_id], unique: true
    add_index :books, :available
  end
end

class CreateAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.date :birth
      t.date :death

      t.timestamps
    end
  end
end

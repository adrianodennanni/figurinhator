class CreateFigurinhas < ActiveRecord::Migration[5.2]
  def change
    create_table :figurinhas do |t|
      t.integer :numero, null: false
      t.integer :quantidade, default: 1, null: false
      t.belongs_to :user, foreign_key: true
      t.belongs_to :figurinha_info, foreign_key: true

      t.timestamps
    end
    add_index :figurinhas, :numero
  end
end

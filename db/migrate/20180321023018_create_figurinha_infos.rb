class CreateFigurinhaInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :figurinha_infos do |t|
      t.string :numero, null: false
      t.string :nome, null: false
      t.string :image_url

      t.timestamps
    end
    add_index :figurinha_infos, :numero
  end
end

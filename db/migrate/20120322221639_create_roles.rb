class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :nome
      t.text :descrizione

      t.timestamps
    end
  end
end

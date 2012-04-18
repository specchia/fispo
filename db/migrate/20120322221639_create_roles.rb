
class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name    #Old rename nome
      t.text :description

      t.timestamps
    end

  end

  def self.down
    drop_table :roles
  end

end

class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :sezione
      t.boolean :protetto
      t.integer :ordinamento
      t.integer :top_section_id

      t.timestamps
    end
  end
end

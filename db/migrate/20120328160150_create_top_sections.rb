class CreateTopSections < ActiveRecord::Migration
  def change
    create_table :top_sections do |t|
      t.string :sezione_top
      t.integer :ordinamento
      t.boolean :se_visibile
      t.string :immagine
      t.string :style

      t.timestamps
    end
  end
end

class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :edition_id
      t.integer :sub_section_id
      t.integer :ordinamento
      t.boolean :se_sommario
      t.text :riassunto
      t.text :titolo
      t.text :testo
      t.string :riferimento
      t.boolean :se_visible_web
      t.datetime :data_scadenza
      t.boolean :se_visible_data
      t.boolean :se_visible_newsletter
      t.boolean :se_protetto
      t.string :immagine_url
      t.text :titolo_no_format
      t.text :testo_no_format
      t.text :riassunto_no_format

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :group_id
      t.integer :organization_id
      t.integer :codice
      t.string :nome
      t.string :titolo
      t.string :soc
      t.string :sede
      t.string :indirizzo
      t.string :telefono
      t.string :fax
      t.string :mail
      t.string :telefono2
      t.string :login
      t.string :mail2
      t.string :pwd
      t.string :registrato
      t.string :data
      t.datetime :datascadenza
      t.string :cap
      t.string :prov
      t.text :note
      t.string :sez
      t.string :iva_
      t.string :codicefiscale
      t.string :partitaiva
      t.text :annotazioni
      t.float :tariffa_precedente
      t.text :sconto_precedente
      t.text :iva_precedente
      t.string :pagamento_precedente
      t.datetime :data_ultimo_pagamento
      t.datetime :data_accredito
      t.integer :anno_competenza
      t.boolean :conferma_registrazione
      t.boolean :abbonato
      t.boolean :disabilitato
      t.integer :parent
      t.integer :crediti
      t.boolean :power_user
      t.string :num_reg_coni
      t.boolean :forum_redattore
      t.boolean :forum_notifica

      t.timestamps
    end
  end
end

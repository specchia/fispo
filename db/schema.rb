# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120322153048) do

  create_table "accounts", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "user_id"
    t.string   "username"
  end

  add_index "accounts", ["email"], :name => "index_accounts_on_email"
  add_index "accounts", ["reset_password_token"], :name => "index_accounts_on_reset_password_token"
  add_index "accounts", ["username"], :name => "index_accounts_on_username", :unique => true

  create_table "contents", :force => true do |t|
    t.integer  "edition_id"
    t.integer  "sub_section_id"
    t.integer  "ordinamento"
    t.boolean  "se_sommario"
    t.text     "riassunto"
    t.text     "titolo"
    t.text     "testo"
    t.string   "riferimento"
    t.boolean  "se_visible_web"
    t.datetime "data_scadenza"
    t.boolean  "se_visible_data"
    t.boolean  "se_visible_newsletter"
    t.boolean  "se_protetto"
    t.string   "immagine_url"
    t.text     "titolo_no_format"
    t.text     "testo_no_format"
    t.text     "riassunto_no_format"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "users", :force => true do |t|
    t.integer  "group_id"
    t.integer  "organization_id"
    t.integer  "codice"
    t.string   "nome"
    t.string   "titolo"
    t.string   "soc"
    t.string   "sede"
    t.string   "indirizzo"
    t.string   "telefono"
    t.string   "fax"
    t.string   "mail"
    t.string   "telefono2"
    t.string   "login"
    t.string   "mail2"
    t.string   "pwd"
    t.string   "registrato"
    t.string   "data"
    t.datetime "datascadenza"
    t.string   "cap"
    t.string   "prov"
    t.text     "note"
    t.string   "sez"
    t.string   "iva_"
    t.string   "codicefiscale"
    t.string   "partitaiva"
    t.text     "annotazioni"
    t.float    "tariffa_precedente"
    t.text     "sconto_precedente"
    t.text     "iva_precedente"
    t.string   "pagamento_precedente"
    t.datetime "data_ultimo_pagamento"
    t.datetime "data_accredito"
    t.integer  "anno_competenza"
    t.boolean  "conferma_registrazione"
    t.boolean  "abbonato"
    t.boolean  "disabilitato"
    t.integer  "parent"
    t.integer  "crediti"
    t.boolean  "power_user"
    t.string   "num_reg_coni"
    t.boolean  "forum_redattore"
    t.boolean  "forum_notifica"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "account_id"
  end

  create_table "utenti", :force => true do |t|
    t.string   "Codice",                  :limit => 50
    t.string   "IVA",                     :limit => 16
    t.string   "Nome"
    t.string   "Titolo"
    t.string   "Soc"
    t.string   "Organismo",               :limit => 50
    t.string   "SiglaOrganismo",          :limit => 50
    t.string   "Affiliata"
    t.string   "Sede"
    t.string   "Indirizzo",               :limit => 50
    t.string   "Telefono"
    t.string   "Fax"
    t.string   "Mail"
    t.string   "Login"
    t.string   "Pwd",                     :limit => 8
    t.string   "Registrato",              :limit => 5
    t.string   "Data",                    :limit => 50
    t.date     "DataScadenza"
    t.string   "Cap",                     :limit => 50
    t.string   "Prov",                    :limit => 25
    t.text     "Note",                    :limit => 2147483647
    t.string   "pagato",                  :limit => 10
    t.datetime "datapag"
    t.text     "notepag",                 :limit => 2147483647
    t.string   "N_FATT",                  :limit => 10
    t.string   "SEZ",                     :limit => 10
    t.string   "NUMERO_PI_O_CF",          :limit => 15
    t.string   "CampoUnAuto",             :limit => 50
    t.string   "TARIFFA",                 :limit => 50
    t.string   "SC",                      :limit => 50
    t.string   "IMP",                     :limit => 50
    t.string   "IVA_",                    :limit => 16
    t.string   "TOTALE_FATTURA",          :limit => 20
    t.string   "PAGAMENTO",               :limit => 50
    t.text     "COMUNICAZIONI",           :limit => 2147483647
    t.string   "CodiceFiscale",           :limit => 16
    t.string   "PartitaIva",              :limit => 11
    t.integer  "IDUtentePrincipale"
    t.text     "Annotazioni",             :limit => 2147483647
    t.decimal  "TariffaPrecedente",                             :precision => 19, :scale => 4, :default => 0.0
    t.float    "ScontoPrecedente",                                                             :default => 0.0
    t.float    "IvaPrecedente",                                                                :default => 0.0
    t.string   "PagamentoPrecedente",     :limit => 100
    t.date     "DataUltimoPagamento"
    t.date     "DataAccredito"
    t.integer  "AnnoCompetenza"
    t.binary   "ConfermaRegistrazione",   :limit => 255
    t.binary   "Abbonato",                :limit => 255
    t.binary   "Disabilitato",            :limit => 255
    t.string   "CodiceSconto",            :limit => 5
    t.string   "MailSecondaria"
    t.integer  "Parent",                                                                       :default => 0
    t.integer  "Crediti",                                                                      :default => 50
    t.string   "Testo1",                  :limit => 100
    t.string   "Testo2",                  :limit => 100
    t.string   "Testo3",                  :limit => 100
    t.float    "Numero1",                                                                      :default => 0.0
    t.float    "Numero2",                                                                      :default => 0.0
    t.float    "Numero3",                                                                      :default => 0.0
    t.datetime "Data1"
    t.datetime "Data2"
    t.datetime "Data3"
    t.binary   "Flag1",                   :limit => 255
    t.binary   "Flag2",                   :limit => 255
    t.binary   "Flag3",                   :limit => 255
    t.binary   "PowerUser",               :limit => 255
    t.string   "numeroregistrazioneconi", :limit => 15,                                        :default => "0"
    t.binary   "FORUM_REDATTORE",         :limit => 255
    t.binary   "FORUM_NOTIFICA",          :limit => 255
    t.integer  "gruppi_utenti_id",        :limit => 2
  end

  add_index "utenti", ["Codice"], :name => "Codice"
  add_index "utenti", ["CodiceFiscale"], :name => "CodiceFiscale"
  add_index "utenti", ["CodiceSconto"], :name => "CodiceSconto"
  add_index "utenti", ["IDUtentePrincipale"], :name => "IDUtentePrincipale"
  add_index "utenti", ["NUMERO_PI_O_CF"], :name => "NUMERO_PI_O_CF"
  add_index "utenti", ["Numero1"], :name => "Numero1"
  add_index "utenti", ["Numero2"], :name => "Numero2"
  add_index "utenti", ["Numero3"], :name => "Numero3"
  add_index "utenti", ["numeroregistrazioneconi"], :name => "NumeroRegistrazioneConi"

end

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

ActiveRecord::Schema.define(:version => 20120328160235) do

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
    t.string   "username"
  end

  add_index "accounts", ["email"], :name => "index_accounts_on_email"
  add_index "accounts", ["reset_password_token"], :name => "index_accounts_on_reset_password_token"
  add_index "accounts", ["username"], :name => "index_accounts_on_username", :unique => true

  create_table "contents", :force => true do |t|
    t.integer  "edition_id"
    t.integer  "section_id"
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

  create_table "sections", :force => true do |t|
    t.string   "sezione"
    t.boolean  "protetto"
    t.integer  "ordinamento"
    t.integer  "top_section_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "top_sections", :force => true do |t|
    t.string   "sezione_top"
    t.integer  "ordinamento"
    t.boolean  "se_visibile"
    t.string   "immagine"
    t.string   "style"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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

end


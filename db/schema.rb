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

ActiveRecord::Schema.define(:version => 20120418110137) do

  create_table "accounts", :force => true do |t|
    t.string   "email",                  :default => "",               :null => false
    t.string   "encrypted_password",     :default => "",               :null => false
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
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "username"
    t.boolean  "forem_admin",            :default => false
    t.string   "forem_state",            :default => "pending_review"
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

  create_table "forem_categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "forem_forums", :force => true do |t|
    t.string  "title"
    t.text    "description"
    t.integer "category_id"
    t.integer "views_count", :default => 0
  end

  create_table "forem_groups", :force => true do |t|
    t.string "name"
  end

  add_index "forem_groups", ["name"], :name => "index_forem_groups_on_name"

  create_table "forem_memberships", :force => true do |t|
    t.integer "group_id"
    t.integer "member_id"
  end

  add_index "forem_memberships", ["group_id"], :name => "index_forem_memberships_on_group_id"

  create_table "forem_moderator_groups", :force => true do |t|
    t.integer "forum_id"
    t.integer "group_id"
  end

  add_index "forem_moderator_groups", ["forum_id"], :name => "index_forem_moderator_groups_on_forum_id"

  create_table "forem_posts", :force => true do |t|
    t.integer  "topic_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "reply_to_id"
    t.string   "state",       :default => "pending_review"
    t.boolean  "notified",    :default => false
  end

  add_index "forem_posts", ["reply_to_id"], :name => "index_forem_posts_on_reply_to_id"
  add_index "forem_posts", ["state"], :name => "index_forem_posts_on_state"
  add_index "forem_posts", ["topic_id"], :name => "index_forem_posts_on_topic_id"
  add_index "forem_posts", ["user_id"], :name => "index_forem_posts_on_user_id"

  create_table "forem_subscriptions", :force => true do |t|
    t.integer "subscriber_id"
    t.integer "topic_id"
  end

  create_table "forem_topics", :force => true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "subject"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "locked",       :default => false,            :null => false
    t.boolean  "pinned",       :default => false
    t.boolean  "hidden",       :default => false
    t.datetime "last_post_at"
    t.string   "state",        :default => "pending_review"
    t.integer  "views_count",  :default => 0
  end

  add_index "forem_topics", ["forum_id"], :name => "index_forem_topics_on_forum_id"
  add_index "forem_topics", ["state"], :name => "index_forem_topics_on_state"
  add_index "forem_topics", ["user_id"], :name => "index_forem_topics_on_user_id"

  create_table "forem_views", :force => true do |t|
    t.integer  "user_id"
    t.integer  "viewable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",             :default => 0
    t.string   "viewable_type"
    t.datetime "current_viewed_at"
    t.datetime "past_viewed_at"
  end

  add_index "forem_views", ["updated_at"], :name => "index_forem_views_on_updated_at"
  add_index "forem_views", ["user_id"], :name => "index_forem_views_on_user_id"
  add_index "forem_views", ["viewable_id"], :name => "index_forem_views_on_topic_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "roles_accounts", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "account_id"
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

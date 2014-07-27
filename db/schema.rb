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

ActiveRecord::Schema.define(:version => 20140721015303) do

  create_table "blog_comments", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "email",      :null => false
    t.string   "website"
    t.text     "body",       :null => false
    t.integer  "post_id",    :null => false
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "blog_comments", ["post_id"], :name => "index_blog_comments_on_post_id"

  create_table "blog_posts", :force => true do |t|
    t.string   "title",                         :null => false
    t.text     "body",                          :null => false
    t.integer  "blogger_id"
    t.string   "blogger_type"
    t.integer  "comments_count", :default => 0, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "slug"
  end

  add_index "blog_posts", ["blogger_type", "blogger_id"], :name => "index_blog_posts_on_blogger_type_and_blogger_id"

  create_table "category1s", :force => true do |t|
    t.string   "cat1cod"
    t.string   "cat1desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "category2s", :force => true do |t|
    t.integer  "category1_id"
    t.string   "cat2cod"
    t.string   "cat2desc"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "category2s", ["category1_id"], :name => "index_category2s_on_category1_id"

  create_table "category3s", :force => true do |t|
    t.integer  "category2_id"
    t.string   "cat3cod"
    t.string   "cat3desc"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "category3s", ["category2_id"], :name => "index_category3s_on_category2_id"

  create_table "contenttags", :force => true do |t|
    t.string   "ctagdesc"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "contenttags", ["taggable_id"], :name => "index_contenttags_on_taggable_id"

  create_table "costtypes", :force => true do |t|
    t.string   "costname"
    t.string   "costdesc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "deliverymethods", :force => true do |t|
    t.string   "dmcod"
    t.string   "dmdesc"
    t.string   "dmimgurl"
    t.string   "dmimgtype"
    t.integer  "dmimgw"
    t.integer  "dmimgh"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "opinions", :force => true do |t|
    t.integer  "opinionable_id"
    t.string   "opinionable_type"
    t.decimal  "rating"
    t.string   "comment"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "optitle"
    t.string   "slug"
  end

  add_index "opinions", ["opinionable_id"], :name => "index_opinions_on_opinionable_id"
  add_index "opinions", ["user_id"], :name => "index_opinions_on_user_id"

  create_table "pg_search_documents", :force => true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "portfolios", :force => true do |t|
    t.integer  "source_id"
    t.string   "pweburl"
    t.text     "physaddress"
    t.decimal  "cost"
    t.string   "currency"
    t.datetime "startdate"
    t.datetime "enddate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subject_module_id"
    t.integer  "learnercount"
    t.integer  "costtype_id"
    t.integer  "schedtype_id"
    t.integer  "subject_id"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.string   "slug"
    t.string   "prttitle"
    t.string   "prtdesc"
  end

  add_index "portfolios", ["created_by_id"], :name => "index_portfolios_on_created_by_id"
  add_index "portfolios", ["slug"], :name => "index_portfolios_on_slug"
  add_index "portfolios", ["updated_by_id"], :name => "index_portfolios_on_updated_by_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "schedtypes", :force => true do |t|
    t.string   "schedname"
    t.string   "scheddesc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "weburl"
    t.text     "physaddress"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "membercount"
    t.integer  "sourcetype_id"
    t.string   "slug"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
  end

  add_index "sources", ["created_by_id"], :name => "index_sources_on_created_by_id"
  add_index "sources", ["slug"], :name => "index_sources_on_slug"
  add_index "sources", ["updated_by_id"], :name => "index_sources_on_updated_by_id"

  create_table "sourcetypes", :force => true do |t|
    t.string   "stcod"
    t.text     "stdesc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subject_modules", :force => true do |t|
    t.integer  "subject_id"
    t.string   "smname"
    t.text     "smdescription"
    t.text     "smpurpose"
    t.integer  "order"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "slug"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
  end

  add_index "subject_modules", ["created_by_id"], :name => "index_subject_modules_on_created_by_id"
  add_index "subject_modules", ["slug"], :name => "index_subject_modules_on_slug"
  add_index "subject_modules", ["updated_by_id"], :name => "index_subject_modules_on_updated_by_id"

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "purpose"
    t.decimal  "complexity",     :precision => 5, :scale => 2
    t.integer  "avgtimetolearn"
    t.integer  "category1_id"
    t.integer  "category2_id"
    t.integer  "category3_id"
    t.string   "slug"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
  end

  add_index "subjects", ["created_by_id"], :name => "index_subjects_on_created_by_id"
  add_index "subjects", ["slug"], :name => "index_subjects_on_slug"
  add_index "subjects", ["updated_by_id"], :name => "index_subjects_on_updated_by_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "usedmethods", :force => true do |t|
    t.integer  "deliverymethod_id"
    t.integer  "deliverable_id"
    t.string   "deliverable_type"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "usedmethods", ["deliverable_id"], :name => "index_usedmethods_on_deliverable_id"
  add_index "usedmethods", ["deliverymethod_id"], :name => "index_usedmethods_on_deliverymethod_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_name"
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.integer  "created_by_id"
  end

  add_index "users_roles", ["created_by_id"], :name => "index_users_roles_on_created_by_id"
  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id", :unique => true

  create_table "users_roles_1", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

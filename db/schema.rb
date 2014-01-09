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

ActiveRecord::Schema.define(:version => 20140101201431) do

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

  create_table "portfolios", :force => true do |t|
    t.integer  "source_id"
    t.string   "pweburl"
    t.text     "physaddress"
    t.decimal  "cost"
    t.string   "currency"
    t.integer  "costtype"
    t.integer  "schedtype"
    t.integer  "method"
    t.datetime "startdate"
    t.datetime "enddate"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "subjectmodule_id"
    t.integer  "learnercount"
  end

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "weburl"
    t.text     "physaddress"
    t.integer  "srctype"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "membercount"
  end

  create_table "subject_modules", :force => true do |t|
    t.integer  "subject_id"
    t.string   "name"
    t.text     "description"
    t.text     "purpose"
    t.integer  "order"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "purpose"
    t.decimal  "complexity",     :precision => 5, :scale => 2
    t.integer  "category1"
    t.integer  "category2"
    t.integer  "category3"
    t.integer  "avgtimetolearn"
  end

end

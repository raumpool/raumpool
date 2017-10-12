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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161129101932) do

  create_table "rooms", force: :cascade do |t|
    t.integer  "user_id",                 limit: 4
    t.string   "name",                    limit: 255
    t.string   "strasse",                 limit: 255
    t.string   "nummer",                  limit: 255
    t.integer  "plz",                     limit: 4,     default: 81829
    t.string   "ort",                     limit: 255,   default: "München"
    t.integer  "groesse",                 limit: 4
    t.integer  "pers_anzahl",             limit: 4,     default: 10
    t.string   "anbieter",                limit: 255
    t.string   "preis",                   limit: 255
    t.string   "kontakt_name",            limit: 255
    t.string   "kontakt_email",           limit: 255
    t.string   "kontakt_telefon",         limit: 255
    t.text     "beschreibung",            limit: 65535
    t.string   "mrbs_link",               limit: 255
    t.string   "weblink",                 limit: 255
    t.boolean  "lage_eingang",                          default: false
    t.boolean  "lage_garten",                           default: false
    t.boolean  "lage_mvv",                              default: false
    t.boolean  "lage_parkplatz",                        default: false
    t.text     "anm_lage",                limit: 65535
    t.boolean  "ausstattung_buehne",                    default: false
    t.boolean  "ausstattung_dunkel",                    default: false
    t.boolean  "ausstattung_klavier",                   default: false
    t.boolean  "moebel_entfernbar",                     default: false
    t.integer  "anzahl_stuehle",          limit: 4
    t.integer  "anzahl_tische",           limit: 4
    t.text     "anm_ausstattung",         limit: 65535
    t.boolean  "technik_disko",                         default: false
    t.boolean  "technik_mikro",                         default: false
    t.boolean  "technik_projektion",                    default: false
    t.boolean  "technik_wlan",                          default: false
    t.text     "anm_technik",             limit: 65535
    t.boolean  "verpflegung_catering",                  default: false
    t.boolean  "verpflegung_gastro",                    default: false
    t.boolean  "verpflegung_selbst",                    default: false
    t.boolean  "verpflegung_teekueche",                 default: false
    t.text     "anm_verpflegung",         limit: 65535
    t.boolean  "zielgruppe_barrierefrei",               default: false
    t.boolean  "zielgruppe_kinder",                     default: false
    t.boolean  "zielgruppe_party",                      default: false
    t.boolean  "zielgruppe_seminar",                    default: false
    t.text     "anm_zielgruppe",          limit: 65535
    t.string   "bestuhlungsplan",         limit: 255
    t.string   "grundriss",               limit: 255
    t.string   "nutzungsvertrag",         limit: 255
    t.text     "anm_dokumente",           limit: 65535
    t.string   "picture",                 limit: 255
    t.string   "picture2",                limit: 255
    t.string   "picture3",                limit: 255
    t.string   "picture4",                limit: 255
    t.text     "anm_bilder",              limit: 65535
    t.string   "created_by",              limit: 255
    t.string   "changed_by",              limit: 255
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  add_index "rooms", ["user_id", "created_at"], name: "index_rooms_on_user_id_and_created_at", using: :btree
  add_index "rooms", ["user_id"], name: "index_rooms_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                       limit: 255
    t.string   "email",                      limit: 255
    t.string   "encrypted_information",      limit: 255
    t.string   "encrypted_information_iv",   limit: 255
    t.string   "encrypted_information_salt", limit: 255
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "password_digest",            limit: 255
    t.string   "status",                     limit: 255
    t.string   "homepage",                   limit: 255
    t.string   "remember_digest",            limit: 255
    t.boolean  "admin",                                  default: false
    t.string   "activation_digest",          limit: 255
    t.boolean  "activated",                              default: false
    t.datetime "activated_at"
    t.string   "reset_digest",               limit: 255
    t.datetime "reset_sent_at"
    t.string   "information",                limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end

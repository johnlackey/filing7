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

ActiveRecord::Schema.define(version: 20170513201335) do

  create_table "CHECK_CONSTRAINTS", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "CONSTRAINT_CATALOG", limit: 128
    t.string "CONSTRAINT_SCHEMA",  limit: 128
    t.string "CONSTRAINT_NAME",    limit: 128,   null: false
    t.text   "CHECK_CLAUSE",       limit: 65535
  end

  create_table "DBInfo", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "DBInfoId",                  null: false
    t.string   "ProgramName",    limit: 50
    t.string   "Version",        limit: 50
    t.datetime "DateCreated"
    t.datetime "LastBackupTime"
    t.integer  "MaximumUsers",              null: false
    t.integer  "ActiveUsers",               null: false
    t.string   "SerialNumber",   limit: 20
    t.string   "NetworkLicense", limit: 20
    t.datetime "AdminTimeStamp"
    t.string   "Password",       limit: 75
    t.index ["DBInfoId"], name: "DBInfoId", unique: true, using: :btree
  end

  create_table "EmptiedTrash", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "RecordId",                  null: false
    t.integer  "NumItemId",                 null: false
    t.string   "TextItemId",                null: false
    t.integer  "LocId",                     null: false
    t.string   "ItemName"
    t.text     "Keywords",    limit: 65535
    t.integer  "CatId"
    t.datetime "ActionDate"
    t.datetime "DateCreated"
    t.integer  "ReviewFreq",                null: false
    t.text     "ItemNote",    limit: 65535
    t.binary   "IsTagged",    limit: 1,     null: false
    t.integer  "Status",                    null: false
    t.datetime "TimeStamp"
    t.index ["CatId"], name: "CatId", using: :btree
    t.index ["LocId"], name: "LocId", using: :btree
    t.index ["RecordId"], name: "RecordId", unique: true, using: :btree
  end

  create_table "ReportParms", primary_key: "ReportParmsId", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "UserId",     limit: 75
    t.string "ReportName", limit: 100
    t.string "ReportId",   limit: 100
    t.string "ParmName",   limit: 100
    t.string "ParmValue",  limit: 100
    t.index ["ReportId", "UserId", "ReportName", "ParmName"], name: "ReportId", unique: true, using: :btree
    t.index ["ReportParmsId"], name: "ReportParmsId", unique: true, using: :btree
  end

  create_table "UserLocInfo", primary_key: "UserLocInfoId", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "UserId",            limit: 75
    t.integer  "LocId",                        null: false
    t.datetime "LastUsedTimeStamp"
    t.index ["LocId"], name: "FK_UserLocInfo_LocId", using: :btree
    t.index ["UserId", "LocId"], name: "UserLocUserId", unique: true, using: :btree
    t.index ["UserLocInfoId"], name: "UserLocInfoIdx", unique: true, using: :btree
  end

  create_table "categories", primary_key: "CatId", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "CatName"
    t.text     "Catnote",   limit: 65535
    t.binary   "Viewable",  limit: 1,     null: false
    t.datetime "TimeStamp"
    t.index ["CatId"], name: "CatId", unique: true, using: :btree
    t.index ["CatName"], name: "CatName", unique: true, using: :btree
  end

  create_table "items", primary_key: "RecordId", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "NumItemId",                 null: false
    t.string   "TextItemId",                null: false
    t.integer  "LocId",                     null: false
    t.string   "ItemName"
    t.text     "Keywords",    limit: 65535
    t.integer  "CatId"
    t.datetime "ActionDate"
    t.datetime "DateCreated"
    t.integer  "ReviewFreq",                null: false
    t.text     "ItemNote",    limit: 65535
    t.binary   "IsTagged",    limit: 1,     null: false
    t.integer  "Status",                    null: false
    t.datetime "TimeStamp"
    t.text     "ItemNotes",   limit: 65535
    t.datetime "deleted"
    t.index ["CatId"], name: "CatId", using: :btree
    t.index ["LocId"], name: "LocId", using: :btree
    t.index ["NumItemId"], name: "NumItemId", using: :btree
    t.index ["RecordId"], name: "RecId", unique: true, using: :btree
    t.index ["Status"], name: "Status", using: :btree
    t.index ["TextItemId"], name: "TextItemId", using: :btree
  end

  create_table "locations", primary_key: "LocId", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "LocName",          limit: 50
    t.text     "LocNote",          limit: 65535
    t.datetime "DateCreated"
    t.boolean  "AllowDecimals",                  default: true, null: false
    t.integer  "MaxCapacity",                    default: 0,    null: false
    t.boolean  "Viewable",                       default: true, null: false
    t.string   "ReviewFreqString", limit: 50
    t.datetime "Timestamp"
    t.datetime "deleted"
    t.index ["LocId"], name: "LocId", unique: true, using: :btree
  end

  create_table "statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       limit: 60
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["name"], name: "index_statuses_on_name", unique: true, using: :btree
  end

  add_foreign_key "items", "locations", column: "LocId", primary_key: "LocId"
end

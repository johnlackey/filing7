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

ActiveRecord::Schema.define(version: 0) do

  create_table "CHECK_CONSTRAINTS", id: false, force: true do |t|
    t.string "CONSTRAINT_CATALOG", limit: 128
    t.string "CONSTRAINT_SCHEMA",  limit: 128
    t.string "CONSTRAINT_NAME",    limit: 128, null: false
    t.text   "CHECK_CLAUSE"
  end

  create_table "DBInfo", id: false, force: true do |t|
    t.integer   "DBInfoId",                  null: false
    t.string    "ProgramName",    limit: 50
    t.string    "Version",        limit: 50
    t.timestamp "DateCreated"
    t.timestamp "LastBackupTime"
    t.integer   "MaximumUsers",              null: false
    t.integer   "ActiveUsers",               null: false
    t.string    "SerialNumber",   limit: 20
    t.string    "NetworkLicense", limit: 20
    t.timestamp "AdminTimeStamp"
    t.string    "Password",       limit: 75
  end

  add_index "DBInfo", ["DBInfoId"], name: "DBInfoId", unique: true, using: :btree

  create_table "EmptiedTrash", id: false, force: true do |t|
    t.integer   "RecordId",              null: false
    t.integer   "NumItemId",             null: false
    t.string    "TextItemId",            null: false
    t.integer   "LocId",                 null: false
    t.string    "ItemName"
    t.text      "Keywords"
    t.integer   "CatId"
    t.timestamp "ActionDate"
    t.timestamp "DateCreated"
    t.integer   "ReviewFreq",            null: false
    t.text      "ItemNote"
    t.binary    "IsTagged",    limit: 1, null: false
    t.integer   "Status",                null: false
    t.timestamp "TimeStamp"
  end

  add_index "EmptiedTrash", ["CatId"], name: "CatId", using: :btree
  add_index "EmptiedTrash", ["LocId"], name: "LocId", using: :btree
  add_index "EmptiedTrash", ["RecordId"], name: "RecordId", unique: true, using: :btree

  create_table "ReportParms", primary_key: "ReportParmsId", force: true do |t|
    t.string "UserId",     limit: 75
    t.string "ReportName", limit: 100
    t.string "ReportId",   limit: 100
    t.string "ParmName",   limit: 100
    t.string "ParmValue",  limit: 100
  end

  add_index "ReportParms", ["ReportId", "UserId", "ReportName", "ParmName"], name: "ReportId", unique: true, using: :btree
  add_index "ReportParms", ["ReportParmsId"], name: "ReportParmsId", unique: true, using: :btree

  create_table "UserLocInfo", primary_key: "UserLocInfoId", force: true do |t|
    t.string    "UserId",            limit: 75
    t.integer   "LocId",                        null: false
    t.timestamp "LastUsedTimeStamp"
  end

  add_index "UserLocInfo", ["LocId"], name: "FK_UserLocInfo_LocId", using: :btree
  add_index "UserLocInfo", ["UserId", "LocId"], name: "UserLocUserId", unique: true, using: :btree
  add_index "UserLocInfo", ["UserLocInfoId"], name: "UserLocInfoIdx", unique: true, using: :btree

  create_table "categories", primary_key: "CatId", force: true do |t|
    t.string    "CatName"
    t.text      "Catnote"
    t.binary    "Viewable",  limit: 1, null: false
    t.timestamp "TimeStamp"
  end

  add_index "categories", ["CatId"], name: "CatId", unique: true, using: :btree
  add_index "categories", ["CatName"], name: "CatName", unique: true, using: :btree

  create_table "items", primary_key: "RecordId", force: true do |t|
    t.integer   "NumItemId",             null: false
    t.string    "TextItemId",            null: false
    t.integer   "LocId",                 null: false
    t.string    "ItemName"
    t.text      "Keywords"
    t.integer   "CatId"
    t.timestamp "ActionDate"
    t.timestamp "DateCreated"
    t.integer   "ReviewFreq",            null: false
    t.text      "ItemNote"
    t.binary    "IsTagged",    limit: 1, null: false
    t.integer   "Status",                null: false
    t.timestamp "TimeStamp"
    t.text      "ItemNotes"
    t.datetime  "deleted"
  end

  add_index "items", ["CatId"], name: "CatId", using: :btree
  add_index "items", ["LocId"], name: "LocId", using: :btree
  add_index "items", ["NumItemId"], name: "NumItemId", using: :btree
  add_index "items", ["RecordId"], name: "RecId", unique: true, using: :btree
  add_index "items", ["Status"], name: "Status", using: :btree
  add_index "items", ["TextItemId"], name: "TextItemId", using: :btree

  create_table "locations", primary_key: "LocId", force: true do |t|
    t.string    "LocName",          limit: 50
    t.text      "LocNote"
    t.timestamp "DateCreated"
    t.binary    "AllowDecimals",    limit: 1,  null: false
    t.integer   "MaxCapacity",                 null: false
    t.binary    "Viewable",         limit: 1,  null: false
    t.string    "ReviewFreqString", limit: 50
    t.timestamp "Timestamp"
    t.datetime  "deleted"
  end

  add_index "locations", ["LocId"], name: "LocId", unique: true, using: :btree

  create_table "phinxlog", primary_key: "version", force: true do |t|
    t.string    "migration_name", limit: 100
    t.timestamp "start_time",                 null: false
    t.timestamp "end_time",                   null: false
  end

  create_table "statuses", force: true do |t|
    t.string "name", limit: 16, null: false
  end

  add_index "statuses", ["name"], name: "name", unique: true, using: :btree

  create_table "sysdiagrams", primary_key: "diagram_id", force: true do |t|
    t.string  "name",         limit: 128, null: false
    t.integer "principal_id",             null: false
    t.integer "version"
    t.binary  "definition"
  end

  add_index "sysdiagrams", ["diagram_id"], name: "PK__sysdiagr__C2B05B611B0907CE", unique: true, using: :btree
  add_index "sysdiagrams", ["principal_id", "name"], name: "UK_principal_name", unique: true, using: :btree

  create_table "transfers", primary_key: "TransferId", force: true do |t|
    t.integer   "OldLocId",                null: false
    t.integer   "OldItemId",               null: false
    t.integer   "OldItemRecId",            null: false
    t.integer   "NewLocId",                null: false
    t.integer   "NewItemId",               null: false
    t.integer   "NewItemRecId",            null: false
    t.binary    "IsConfirmed",  limit: 1,  null: false
    t.timestamp "TransferDate"
    t.timestamp "ConfirmDate"
    t.binary    "IsCancelled",  limit: 1,  null: false
    t.string    "TransferType", limit: 4
    t.string    "UserId",       limit: 75
  end

  add_index "transfers", ["NewItemId"], name: "NewItemId", using: :btree
  add_index "transfers", ["NewItemRecId"], name: "NewItemRecId", using: :btree
  add_index "transfers", ["NewLocId"], name: "NewLocId", using: :btree
  add_index "transfers", ["OldItemId"], name: "OldItemId", using: :btree
  add_index "transfers", ["OldItemRecId"], name: "OldItemRecId", using: :btree
  add_index "transfers", ["OldLocId"], name: "OldLocId", using: :btree
  add_index "transfers", ["TransferId"], name: "TransferId", unique: true, using: :btree

end

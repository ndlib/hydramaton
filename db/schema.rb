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

ActiveRecord::Schema.define(version: 20140312135638) do

  create_table "activity_engine_activities", force: true do |t|
    t.integer  "user_id"
    t.string   "subject_type",  null: false
    t.string   "subject_id",    null: false
    t.string   "activity_type", null: false
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activity_engine_activities", ["user_id"], name: "index_activity_engine_activities_on_user_id", using: :btree

  create_table "admin_announcement_dismissals", force: true do |t|
    t.integer  "user_id"
    t.integer  "admin_announcement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_announcement_dismissals", ["admin_announcement_id"], name: "index_admin_announcement_dismissals_on_admin_announcement_id", using: :btree
  add_index "admin_announcement_dismissals", ["user_id", "admin_announcement_id"], name: "[:admin_announcement_dismissals_join_index]", using: :btree
  add_index "admin_announcement_dismissals", ["user_id"], name: "index_admin_announcement_dismissals_on_user_id", using: :btree

  create_table "admin_announcements", force: true do |t|
    t.text     "message"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_announcements", ["end_at"], name: "index_admin_announcements_on_end_at", using: :btree
  add_index "admin_announcements", ["start_at", "end_at"], name: "[:admin_announcements_for_index]", using: :btree
  add_index "admin_announcements", ["start_at"], name: "index_admin_announcements_on_start_at", using: :btree

  create_table "admin_user_whitelists", force: true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_user_whitelists", ["username"], name: "index_admin_user_whitelists_on_username", unique: true, using: :btree

  create_table "bookmarks", force: true do |t|
    t.integer  "user_id",     null: false
    t.string   "document_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_type"
  end

  add_index "bookmarks", ["user_id", "user_type"], name: "index_bookmarks_on_user_id_and_user_type", using: :btree

  create_table "checksum_audit_logs", force: true do |t|
    t.string   "pid"
    t.string   "dsid"
    t.string   "version"
    t.integer  "pass"
    t.string   "expected_result"
    t.string   "actual_result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "checksum_audit_logs", ["pid", "dsid"], name: "by_pid_and_dsid", using: :btree

  create_table "conversations", force: true do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "domain_terms", force: true do |t|
    t.string "model"
    t.string "term"
  end

  add_index "domain_terms", ["model", "term"], name: "terms_by_model_and_term", using: :btree

  create_table "domain_terms_local_authorities", id: false, force: true do |t|
    t.integer "domain_term_id"
    t.integer "local_authority_id"
  end

  add_index "domain_terms_local_authorities", ["domain_term_id", "local_authority_id"], name: "dtla_by_ids2", using: :btree
  add_index "domain_terms_local_authorities", ["local_authority_id", "domain_term_id"], name: "dtla_by_ids1", using: :btree

  create_table "follows", force: true do |t|
    t.integer  "followable_id",                   null: false
    t.string   "followable_type",                 null: false
    t.integer  "follower_id",                     null: false
    t.string   "follower_type",                   null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "help_requests", force: true do |t|
    t.string   "view_port"
    t.text     "current_url"
    t.string   "user_agent"
    t.string   "resolution"
    t.text     "how_can_we_help_you"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "javascript_enabled"
    t.string   "release_version"
  end

  add_index "help_requests", ["created_at"], name: "index_help_requests_on_created_at", using: :btree
  add_index "help_requests", ["user_id"], name: "index_help_requests_on_user_id", using: :btree

  create_table "hydramata_core_attachments", id: false, force: true do |t|
    t.string   "pid",                   limit: 32, null: false
    t.string   "attached_to_pid",       limit: 32, null: false
    t.string   "attached_file_name"
    t.string   "attached_content_type"
    t.integer  "attached_file_size"
    t.datetime "attached_updated_at"
  end

  add_index "hydramata_core_attachments", ["attached_to_pid"], name: "index_hydramata_core_attachments_on_attached_to_pid", using: :btree
  add_index "hydramata_core_attachments", ["pid"], name: "index_hydramata_core_attachments_on_pid", using: :btree

  create_table "hydramata_core_relationships", force: true do |t|
    t.string   "subject_id",              null: false
    t.string   "subject_type", limit: 32, null: false
    t.string   "predicate",    limit: 64, null: false
    t.string   "target_id",               null: false
    t.string   "target_type",  limit: 32, null: false
    t.string   "authority_id",              null: false
    t.string   "authority_type", limit: 64, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hydramata_core_relationships", ["authority_id", "authority_type"], name: "hc_rel_creator", using: :btree
  add_index "hydramata_core_relationships", ["predicate"], name: "hc_rel_predicate", using: :btree
  add_index "hydramata_core_relationships", ["subject_id", "subject_type"], name: "hc_rel_subject", using: :btree
  add_index "hydramata_core_relationships", ["target_id", "target_type"], name: "hc_rel_target", using: :btree

  create_table "hydramata_core_work_drafts", id: false, force: true do |t|
    t.string  "pid",                                 null: false
    t.string  "work_type",        limit: 64,         null: false
    t.integer "owner_id"
    t.string  "owner_type",       limit: 64
    t.text    "attributes_store", limit: 2147483647
  end

  add_index "hydramata_core_work_drafts", ["owner_id", "owner_type"], name: "index_hydramata_core_work_drafts_on_owner_id_and_owner_type", using: :btree

  create_table "hydramata_groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hydramata_policies", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hydramata_policy_elements", force: true do |t|
    t.integer  "policy_id",        null: false
    t.string   "group_identifier", null: false
    t.string   "action_name",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "local_authorities", force: true do |t|
    t.string "name"
  end

  create_table "local_authority_entries", force: true do |t|
    t.integer "local_authority_id"
    t.string  "label"
    t.string  "uri"
  end

  add_index "local_authority_entries", ["local_authority_id", "label"], name: "entries_by_term_and_label", using: :btree
  add_index "local_authority_entries", ["local_authority_id", "uri"], name: "entries_by_term_and_uri", using: :btree

  create_table "notifications", force: true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "notification_code"
    t.string   "attachment"
  end

  add_index "notifications", ["conversation_id"], name: "index_notifications_on_conversation_id", using: :btree
  add_index "notifications", ["notified_object_id", "notified_object_type"], name: "notifications_notified_object", using: :btree
  add_index "notifications", ["sender_id", "sender_type"], name: "index_notifications_on_sender_id_and_sender_type", using: :btree

  create_table "object_access", primary_key: "access_id", force: true do |t|
    t.datetime "date_accessed"
    t.string   "ip_address"
    t.string   "host_name"
    t.string   "user_agent"
    t.string   "request_method"
    t.string   "path_info"
    t.integer  "repo_object_id"
    t.integer  "purl_id"
  end

  create_table "proxy_deposit_rights", force: true do |t|
    t.integer  "grantor_id"
    t.integer  "grantee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proxy_deposit_rights", ["grantee_id"], name: "index_proxy_deposit_rights_on_grantee_id", using: :btree
  add_index "proxy_deposit_rights", ["grantor_id"], name: "index_proxy_deposit_rights_on_grantor_id", using: :btree

  create_table "purl", primary_key: "purl_id", force: true do |t|
    t.integer  "repo_object_id"
    t.string   "access_count"
    t.datetime "last_accessed"
    t.string   "source_app"
    t.datetime "date_created"
  end

  create_table "receipts", force: true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "receipts", ["notification_id"], name: "index_receipts_on_notification_id", using: :btree
  add_index "receipts", ["receiver_id", "receiver_type"], name: "index_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "repo_object", primary_key: "repo_object_id", force: true do |t|
    t.string   "filename"
    t.string   "url"
    t.datetime "date_added"
    t.string   "add_source_ip"
    t.datetime "date_modified"
    t.string   "information"
  end

  create_table "searches", force: true do |t|
    t.text     "query_params"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_type"
  end

  add_index "searches", ["user_id", "user_type"], name: "index_searches_on_user_id_and_user_type", using: :btree
  add_index "searches", ["user_id"], name: "index_searches_on_user_id", using: :btree

  create_table "single_use_links", force: true do |t|
    t.string   "downloadKey"
    t.string   "path"
    t.string   "itemId"
    t.datetime "expires"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subject_local_authority_entries", force: true do |t|
    t.string "label"
    t.string "lowerLabel"
    t.string "url"
  end

  add_index "subject_local_authority_entries", ["lowerLabel"], name: "entries_by_lower_label", using: :btree

  create_table "trophies", force: true do |t|
    t.integer  "user_id"
    t.string   "generic_file_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trophies", ["user_id"], name: "index_trophies_on_user_id", using: :btree

  create_table "user_whitelists", force: true do |t|
    t.string "username"
  end

  add_index "user_whitelists", ["username"], name: "index_user_whitelists_on_username", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                                default: "",    null: false
    t.string   "encrypted_password",                   default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "guest",                                default: false
    t.string   "username",                                             null: false
    t.string   "facebook_handle"
    t.string   "twitter_handle"
    t.string   "googleplus_handle"
    t.string   "name"
    t.string   "address"
    t.string   "admin_area"
    t.string   "department"
    t.string   "title"
    t.string   "office"
    t.string   "chat_id"
    t.string   "website"
    t.string   "affiliation"
    t.string   "telephone"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "group_list"
    t.datetime "groups_last_update"
    t.boolean  "agreed_to_terms_of_service",           default: false
    t.string   "repository_id"
    t.boolean  "user_does_not_require_profile_update", default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["repository_id"], name: "index_users_on_repository_id", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  create_table "version_committers", force: true do |t|
    t.string   "obj_id"
    t.string   "datastream_id"
    t.string   "version_id"
    t.string   "committer_login"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

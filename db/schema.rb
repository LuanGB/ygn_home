# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_118_183_836) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_admin_comments', force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.string 'author_type'
    t.bigint 'author_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource'
  end

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'blog_author_posts', force: :cascade do |t|
    t.bigint 'author_id', null: false
    t.bigint 'post_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_blog_author_posts_on_author_id'
    t.index ['post_id'], name: 'index_blog_author_posts_on_post_id'
  end

  create_table 'blog_authors', force: :cascade do |t|
    t.string 'name'
    t.string 'bio'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'blog_categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'blog_category_posts', force: :cascade do |t|
    t.bigint 'category_id', null: false
    t.bigint 'post_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_blog_category_posts_on_category_id'
    t.index ['post_id'], name: 'index_blog_category_posts_on_post_id'
  end

  create_table 'blog_comment_posts', force: :cascade do |t|
    t.bigint 'comment_id', null: false
    t.bigint 'post_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['comment_id'], name: 'index_blog_comment_posts_on_comment_id'
    t.index ['post_id'], name: 'index_blog_comment_posts_on_post_id'
  end

  create_table 'blog_comments', force: :cascade do |t|
    t.string 'date'
    t.string 'content'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'blog_post_tags', force: :cascade do |t|
    t.bigint 'post_id', null: false
    t.bigint 'tag_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_blog_post_tags_on_post_id'
    t.index ['tag_id'], name: 'index_blog_post_tags_on_tag_id'
  end

  create_table 'blog_posts', force: :cascade do |t|
    t.string 'title'
    t.string 'content'
    t.datetime 'published_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'blog_tags', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'newsletter_subscriptions', force: :cascade do |t|
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'urids', force: :cascade do |t|
    t.string 'resource_type', null: false
    t.bigint 'resource_id', null: false
    t.string 'slug'
    t.uuid 'uid'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[resource_type resource_id], name: 'index_urids_on_resource'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'blog_author_posts', 'blog_authors', column: 'author_id'
  add_foreign_key 'blog_author_posts', 'blog_posts', column: 'post_id'
  add_foreign_key 'blog_category_posts', 'blog_categories', column: 'category_id'
  add_foreign_key 'blog_category_posts', 'blog_posts', column: 'post_id'
  add_foreign_key 'blog_comment_posts', 'blog_comments', column: 'comment_id'
  add_foreign_key 'blog_comment_posts', 'blog_posts', column: 'post_id'
  add_foreign_key 'blog_post_tags', 'blog_posts', column: 'post_id'
  add_foreign_key 'blog_post_tags', 'blog_tags', column: 'tag_id'
end

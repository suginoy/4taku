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

ActiveRecord::Schema.define(:version => 20111208080740) do

  create_table "questions", :force => true do |t|
    t.integer  "number"
    t.string   "title"
    t.text     "description"
    t.string   "choice1"
    t.string   "choice2"
    t.string   "choice3"
    t.string   "choice4"
    t.integer  "answer"
    t.text     "explanation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", :force => true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.integer  "user_answer"
    t.boolean  "correct"
    t.date     "answer_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "summary_id"
  end

  add_index "scores", ["question_id"], :name => "index_scores_on_question_id"
  add_index "scores", ["summary_id"], :name => "index_scores_on_summary_id"
  add_index "scores", ["user_id"], :name => "index_scores_on_user_id"

  create_table "summaries", :force => true do |t|
    t.integer  "total"
    t.integer  "right"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "question_id"
  end

  add_index "summaries", ["question_id"], :name => "index_summaries_on_question_id"
  add_index "summaries", ["user_id"], :name => "index_summaries_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

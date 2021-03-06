#encoding: utf-8
class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email, :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at

      t.string :name
      t.string :surname
      t.string :phone
      t.string :about
      t.integer :role_id
      t.string :organization
      t.boolean :internal

      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Token authenticatable
      # t.string :authentication_token

      t.timestamps
    end

    add_index :users, :email, :unique => true
    add_index :users, :reset_password_token, :unique => true
    add_index :users, :role_id
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true

    User.create(:email => "admin@classicrent.ru", :password => "enlightenment", :name => "Rafael", :role_id => 0)
    User.create(:email => "manager@classicrent.ru", :password => "manager@classicrent.ru", :name => "Менеджер", :role_id => 1)
    User.create(:email => "rieltor@classicrent.ru", :password => "rieltor@classicrent.ru", :name => "Риэлтор", :role_id => 2)
    User.create(:email => "user@classicrent.ru", :password => "user@classicrent.ru", :name => "Пользователь", :role_id => 3)
  end
end
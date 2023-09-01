# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Invitable
      t.string      :invitation_token
      t.datetime    :invitation_created_at
      t.datetime    :invitation_sent_at
      t.datetime    :invitation_accepted_at
      t.integer     :invitation_limit
      t.references  :invited_by, polymorphic: true
      t.integer     :invitations_count, default: 0

      ## JWT Authenticatable
      t.string      :jti

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :invitation_token,     unique: true
    add_index :users, :invited_by_id
    add_index :users, :jti,                  unique: true
  end
end

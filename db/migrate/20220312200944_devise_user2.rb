class DeviseUser2 < ActiveRecord::Migration[6.1]
  def change
    change_column(:users, :email, :string, default: '')
    add_column(:users, :reset_password_token, :string)
    add_column(:users, :reset_password_sent_at, :datetime)
    add_index(:users, :reset_password_token, unique: true)
  end
end

class DeviseUser < ActiveRecord::Migration[6.1]
  def change
    change_column(:users, :password, :string, default: '')
    rename_column(:users, :password, :encrypted_password)
  end
end

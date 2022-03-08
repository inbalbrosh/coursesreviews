class DefaultCreatedAtUsers < ActiveRecord::Migration[6.1]
  def change
    change_column(:users, :updated_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' })
    change_column(:users, :created_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' })
  end
end

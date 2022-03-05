class DefaultCreatedAt < ActiveRecord::Migration[6.1]
  def change
    change_column(:courses, :updated_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' })
    change_column(:courses, :created_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' })
  end
end

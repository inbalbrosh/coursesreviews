class AddDefaultToCreateAt < ActiveRecord::Migration[6.1]
  def change
    change_column(:instructors, :created_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' })
    change_column(:instructors, :updated_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' })
  end
end

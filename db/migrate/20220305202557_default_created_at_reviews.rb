class DefaultCreatedAtReviews < ActiveRecord::Migration[6.1]
  def change
    change_column(:reviews, :updated_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' })
    change_column(:reviews, :created_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' })
  end
end

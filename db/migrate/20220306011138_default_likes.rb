class DefaultLikes < ActiveRecord::Migration[6.1]
  def change
    change_column(:reviews, :likes, :integer, default: -> { 0 })
  end
end

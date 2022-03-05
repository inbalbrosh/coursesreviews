class AddUserIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column(:reviews, :user_id, :integer)
    add_foreign_key(:reviews, :users, on_delete: :cascade, validate: true)
    add_foreign_key(:courses, :instructors, on_delete: :cascade, validate: true)
  end
end

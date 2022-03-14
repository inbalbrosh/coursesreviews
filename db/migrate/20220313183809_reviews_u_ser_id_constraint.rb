class ReviewsUSerIdConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:reviews, :user_id, false)
    change_column_null(:reviews, :comment, false)
    change_column_null(:reviews, :score, false)
  end
end

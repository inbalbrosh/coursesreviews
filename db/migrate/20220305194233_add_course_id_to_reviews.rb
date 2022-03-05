class AddCourseIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column(:reviews, :course_id, :integer)
    add_foreign_key(:reviews, :courses, on_delete: :cascade, validate: true)
  end
end

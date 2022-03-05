class AddTitleToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :title, :string
  end
end

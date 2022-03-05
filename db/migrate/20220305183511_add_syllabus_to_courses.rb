class AddSyllabusToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :syllabus, :string
  end
end

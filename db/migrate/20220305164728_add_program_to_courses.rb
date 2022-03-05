class AddProgramToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :program, :string
  end
end

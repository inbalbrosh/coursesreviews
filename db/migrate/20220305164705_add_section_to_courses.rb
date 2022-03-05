class AddSectionToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :section, :string
  end
end

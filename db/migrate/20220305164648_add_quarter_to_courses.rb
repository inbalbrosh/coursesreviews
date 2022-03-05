class AddQuarterToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :quarter, :string
  end
end

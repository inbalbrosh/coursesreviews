class RemoveColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column(:courses, :section)
    remove_column(:courses, :program)
    remove_column(:courses, :quarter)
    add_column(:courses, :number, :integer)
  end
end

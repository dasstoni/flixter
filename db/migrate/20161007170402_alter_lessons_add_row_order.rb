class AlterLessonsAddRowOrder < ActiveRecord::Migration
  def change
    add_column :lessons, :row_order, :integer
    add_index :lessons, :row_order
  end
end

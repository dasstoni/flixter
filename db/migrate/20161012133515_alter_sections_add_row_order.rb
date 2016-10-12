class AlterSectionsAddRowOrder < ActiveRecord::Migration
  def change
    add_column :sections, :row_order, :integer
    add_index :sections, :row_order
  end
end

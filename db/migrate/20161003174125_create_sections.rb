class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.integer :course_id

      t.timestamps
    end
  end
end

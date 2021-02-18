class DropTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :professor_students
    drop_table :students
  end
end

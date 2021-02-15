class AddClassToClassLists < ActiveRecord::Migration[5.2]
  def change
    add_column :class_lists, :class, :string
  end
end

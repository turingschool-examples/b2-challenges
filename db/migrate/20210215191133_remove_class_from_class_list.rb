class RemoveClassFromClassList < ActiveRecord::Migration[5.2]
  def change
    remove_column :class_lists, :class, :string
  end
end

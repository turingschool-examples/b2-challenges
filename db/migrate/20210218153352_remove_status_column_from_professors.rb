class RemoveStatusColumnFromProfessors < ActiveRecord::Migration[5.2]
  def change
    remove_column :professors, :status, :string
  end
end

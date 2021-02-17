class RemoveSpecialtyFromProfessors < ActiveRecord::Migration[5.2]
  def change
    remove_column :professors, :specialty, :string
  end
end

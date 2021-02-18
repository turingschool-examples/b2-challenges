class AddStatusColumnToProfessors < ActiveRecord::Migration[5.2]
  def change
    add_column :professors, :status, :string
  end
end

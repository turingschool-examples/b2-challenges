class ChangeSpeciatlyOnProfessors < ActiveRecord::Migration[5.2]
  def change
    change_table :professors do |t|
      t.rename :speciatly, :specialty
    end
  end
end

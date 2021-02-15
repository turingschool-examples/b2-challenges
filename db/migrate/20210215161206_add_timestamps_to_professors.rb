class AddTimestampsToProfessors < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :professors
  end
end

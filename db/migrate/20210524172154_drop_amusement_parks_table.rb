class DropAmusementParksTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :amusement_parks, force: :cascade
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

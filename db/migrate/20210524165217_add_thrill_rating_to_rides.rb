class AddThrillRatingToRides < ActiveRecord::Migration[5.2]
  def change
    add_column :rides, :thrill_rating, :integer
  end
end

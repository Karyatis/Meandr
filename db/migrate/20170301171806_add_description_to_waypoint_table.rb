class AddDescriptionToWaypointTable < ActiveRecord::Migration[5.0]
  def change
    add_column :waypoints, :description, :string, {limit: 50}
  end
end

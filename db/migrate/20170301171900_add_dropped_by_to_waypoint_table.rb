class AddDroppedByToWaypointTable < ActiveRecord::Migration[5.0]
  def change
    add_column :waypoints, :dropped_by, :string, {limit: 50}
  end
end

class CreateWaypoints < ActiveRecord::Migration[5.0]
  def change
    create_table :waypoints do |t|
    	# t.string :name, { null: false }
    	t.st_point :coordinates, geographic: true
      t.timestamps
    end
  end
end

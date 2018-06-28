class AddTimeZoneToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :time_zone, :string
  end
end

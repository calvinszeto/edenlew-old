class AddPrimaryIconAndPositionToImages < ActiveRecord::Migration
  def change
    add_column :images, :primary_icon, :boolean
    add_column :images, :position, :integer
  end
end

class AddTimestampsToProjects < ActiveRecord::Migration
  def change
    change_table(:projects) {|t| t.timestamps}
  end
end

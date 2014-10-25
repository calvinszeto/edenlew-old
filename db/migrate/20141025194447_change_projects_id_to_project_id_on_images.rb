class ChangeProjectsIdToProjectIdOnImages < ActiveRecord::Migration
  def change
    change_table :images do |t|
      t.remove :projects_id
      t.references :project
    end
  end
end

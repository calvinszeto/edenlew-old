class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :caption
      t.string :file
			t.references :projects
    end
  end
end

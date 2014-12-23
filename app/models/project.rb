# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  start_date  :date
#  finish_date :date
#  content     :text
#  visible     :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

class Project < ActiveRecord::Base
	has_many :images
  has_many :categorizations
  has_many :categories, through: :categorizations

  def update_categories(category_names)
    update_attribute :category_ids, category_names.map{|name| Category.find_by(name: name).id}
  end

  def icon_url
    primary_image.icon_url
  end

  def primary_image
    images.find_by(primary: true)
  end

  def self.whitelisted_attributes
    [:name, :start_date, :finish_date, :content, :visible]
  end
end

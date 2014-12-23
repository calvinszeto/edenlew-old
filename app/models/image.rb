# == Schema Information
#
# Table name: images
#
#  id           :integer          not null, primary key
#  caption      :text
#  file         :string(255)
#  project_id   :integer
#  primary_icon :boolean
#  position     :integer
#

class Image < ActiveRecord::Base
	mount_uploader :file, FileUploader

	belongs_to :project

  def icon_url
    file.icon.url
  end

  def self.whitelisted_attributes
    [:caption, :primary_icon, :position]
  end
end

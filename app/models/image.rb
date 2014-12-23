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
  after_save :set_single_primary

	belongs_to :project

  def icon_url
    file.icon.url
  end

  def set_single_primary
    unless self.project.nil?
      images = Image.where(project: self.project)
      if (primary_icons = images.where(primary_icon: true)).count != 1
        primary_icons.each{|img| img.primary_icon = false}
        self.primary_icon = true
        Image.skip_callback :save, :after, :set_single_primary
        primary_icons.map(&:save)
        self.save
        Image.set_callback :save, :after, :set_single_primary
      end
    end
  end

  def self.whitelisted_attributes
    [:caption, :primary_icon, :position]
  end
end

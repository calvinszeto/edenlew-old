# == Schema Information
#
# Table name: images
#
#  id          :integer          not null, primary key
#  caption     :text
#  file        :string(255)
#  projects_id :integer
#

class Image < ActiveRecord::Base
	mount_uploader :file, FileUploader

	belongs_to :project
end

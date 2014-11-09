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

  def self.whitelisted_attributes
    [:name, :start_date, :finish_date, :content, :visible]
  end
end

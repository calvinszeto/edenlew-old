# == Schema Information
#
# Table name: categories
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :projects, through: :categorizations

  validates :name, uniqueness: true

  def whitelisted_attributes
    [:name]
  end
end

# == Schema Information
#
# Table name: categorizations
#
#  id          :integer          not null, primary key
#  project_id  :integer
#  category_id :integer
#

class Categorization < ActiveRecord::Base
  belongs_to :project
  belongs_to :category
end

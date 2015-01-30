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
#  location    :string(255)
#

FactoryGirl.define do
  factory :project do
    name 'project'
    content 'content'
    visible false
  end
end

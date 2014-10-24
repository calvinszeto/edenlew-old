# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  start_date  :date
#  finish_date :date
#  content     :text
#

FactoryGirl.define do
  factory :project do
    name "project"
    content "content"
  end
end

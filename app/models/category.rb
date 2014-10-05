class Category < ActiveRecord::Base
  has_many :projects, through: :categorizations
end
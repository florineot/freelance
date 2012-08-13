class Scope < ActiveRecord::Base
  attr_accessible :name
  has_many :specializations
  has_many :companies
  has_many :resumes
  has_and_belongs_to_many :projects
end

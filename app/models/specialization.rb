class Specialization < ActiveRecord::Base
  attr_accessible :name, :area_id
  has_and_belongs_to_many :resumes
  has_many :projects, through: :project_specializations
  has_many :project_specializations
  belongs_to :area
end

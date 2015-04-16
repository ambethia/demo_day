class Cohort < ActiveRecord::Base
  has_many :projects
  has_many :students, :through => :projects

  scope :current, -> { where(:is_current => true) }
end

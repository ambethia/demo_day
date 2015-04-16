class Project < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :program

  has_many :students
end

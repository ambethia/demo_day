class Program < ActiveRecord::Base
  has_many :projects
  has_many :students, :through => :projects
  mount_uploader :logo_img, ImageUploader

end

class Student < ActiveRecord::Base
  belongs_to :project
  mount_uploader :headshot_img, ImageUploader

end

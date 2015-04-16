class RenameLogoAndPhotoFields < ActiveRecord::Migration
  def change
    rename_column :programs, :logo, :logo_img
    add_column :students, :headshot_img, :string
  end
end

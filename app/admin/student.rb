ActiveAdmin.register Student do
  permit_params :project_id, :name, :email, :twitter, :github, :bio, :portfolio_url, :headshot_img

  index do
    selectable_column
    column :name
    img_column :headshot_img
    actions
  end
end

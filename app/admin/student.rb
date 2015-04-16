ActiveAdmin.register Student do
  permit_params :project_id, :name, :email, :twitter, :github, :bio, :portfolio_url, :headshot_img
end

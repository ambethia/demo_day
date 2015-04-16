ActiveAdmin.register Project do
  permit_params :cohort_id, :program_id, :description, :title, :web_url, :repo_url

  index do
    selectable_column
    column :title
    column :cohort_id
    column :program_id
    actions
  end

end
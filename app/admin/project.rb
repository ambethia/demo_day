ActiveAdmin.register Project do
  permit_params :cohort_id, :program_id, :description, :title, :web_url, :repo_url, :order

  index do
    selectable_column
    column :title
    column :cohort
    column :program
    column :order
    actions
  end
end

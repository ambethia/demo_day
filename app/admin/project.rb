ActiveAdmin.register Project do
  permit_params :cohort_id, :program_id, :description, :title, :web_url, :repo_url

end

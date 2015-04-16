ActiveAdmin.register Cohort do
  permit_params :title, :is_current, :introductions

  index do
    selectable_column
    column :title
    column :is_current
    actions
  end

end

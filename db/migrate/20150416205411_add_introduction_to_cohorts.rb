class AddIntroductionToCohorts < ActiveRecord::Migration
  def change
    add_column :cohorts, :introduction, :text
  end
end

class AddLinksToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :web_url, :string
    add_column :projects, :repo_url, :string
    add_column :students, :portfolio_url, :string
  end
end

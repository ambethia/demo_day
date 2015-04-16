class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :cohort, index: true, foreign_key: true
      t.references :program, index: true, foreign_key: true
      t.string :title

      t.timestamps null: false
    end
  end
end

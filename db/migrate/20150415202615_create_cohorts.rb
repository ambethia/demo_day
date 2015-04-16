class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :title
      t.boolean :is_current

      t.timestamps null: false
    end
  end
end

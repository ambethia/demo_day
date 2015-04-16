class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :project, index: true, foreign_key: true
      t.string :name
      t.string :email
      t.string :twitter
      t.string :github
      t.text :bio

      t.timestamps null: false
    end
  end
end

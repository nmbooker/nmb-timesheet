class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :project_id
      t.integer :activity_id
      t.date :date
      t.integer :minutes
      t.text :description

      t.timestamps
    end
  end
end

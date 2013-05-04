class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.int :project_id
      t.int :activity_id
      t.date :date
      t.int :minutes
      t.text :description

      t.timestamps
    end
  end
end

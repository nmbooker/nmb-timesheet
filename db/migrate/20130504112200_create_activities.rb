class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end

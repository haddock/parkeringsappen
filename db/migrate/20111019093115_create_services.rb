class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :street
      t.string :areacode
      t.string :city
      t.string :day
      t.string :starthour
      t.string :endhour
      t.string :note

      t.timestamps
    end
  end
end

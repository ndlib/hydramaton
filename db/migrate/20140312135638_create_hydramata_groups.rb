class CreateHydramataGroups < ActiveRecord::Migration
  def change
    create_table :hydramata_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end

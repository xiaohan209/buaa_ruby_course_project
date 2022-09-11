class CreateDesigns < ActiveRecord::Migration[5.2]
  def change
    create_table :designs do |t|
      t.integer :sales
      t.string :design_name

      t.timestamps
    end
  end
end

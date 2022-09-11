class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.string :size_name
      t.string :description

      t.timestamps
    end
  end
end

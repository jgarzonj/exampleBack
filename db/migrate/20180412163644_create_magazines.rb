class CreateMagazines < ActiveRecord::Migration[5.1]
  def change
    create_table :magazines do |t|
      t.string :name
      t.string :author
      t.string :file

      t.timestamps
    end
  end
end

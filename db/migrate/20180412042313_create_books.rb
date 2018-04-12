class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :description
      t.string :author
      t.string :file

      t.timestamps
    end
  end
end

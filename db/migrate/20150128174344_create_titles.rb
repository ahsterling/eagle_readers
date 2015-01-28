class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :author
      t.text :description
      t.datetime :pub_date
      t.integer :pages
      t.string :isbn
      t.string :subject_array, array: true, default: []
      t.integer :genre_id

      t.timestamps null: false
    end
  end
end

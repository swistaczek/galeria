class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.text :body
      t.string :ip
      t.integer :rating
      t.integer :photo_id

      t.timestamps
    end
  end
end

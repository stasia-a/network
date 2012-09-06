class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :avatar 
      t.string :title
      t.string :comments
      t.integer :user_id

      t.timestamps
    end
  end
end

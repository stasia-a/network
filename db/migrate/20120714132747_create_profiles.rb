class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name, :default => ""
      t.string :last_name, :default => ""
      t.string :nickname, :default => ""
      t.string :education, :default => ""
      t.string :status, :default => ""
      t.integer :user_id
      t.attachment :avatar  

      t.timestamps
    end
  end
end

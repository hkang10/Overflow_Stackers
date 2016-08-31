class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.text :text, null: false
  		t.integer :user_id, null: false
  		t.reference :commentable, polymorphic: true

  		t.timestamps(null: false)
  	end
  end
end

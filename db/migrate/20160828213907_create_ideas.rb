class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.references :user
      t.text :idea

      t.timestamps
    end
  end
end

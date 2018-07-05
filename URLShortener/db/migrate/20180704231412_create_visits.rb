class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.string :short_url, presence: true 
      t.integer :user, presence: true 
      t.timestamps
    end
  end
end

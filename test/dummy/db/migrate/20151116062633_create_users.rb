class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :subscribed_at

      t.timestamps null: false
    end
  end
end

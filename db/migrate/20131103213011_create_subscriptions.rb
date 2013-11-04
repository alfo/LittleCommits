class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :bergcloud_subscription_id
      t.string :bergcloud_endpoint
      t.string :email

      t.timestamps
    end
  end
end

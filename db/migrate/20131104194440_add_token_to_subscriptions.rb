class AddTokenToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :token, :string
  end
end

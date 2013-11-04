class Subscription < ActiveRecord::Base
	
	validates_presence_of :bergcloud_subscription_id, :bergcloud_endpoint, :email
	
end

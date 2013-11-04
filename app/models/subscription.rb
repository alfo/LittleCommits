class Subscription < ActiveRecord::Base
	
	validates_presence_of :bergcloud_subscription_id, :bergcloud_endpoint, :email
	
	before_create :generate_token
	after_create :send_email
	
	def generate_token
		generate_random(:token)
	end
	
	def send_email
		SubscriptionsMailer.new_subscription(self).deliver!
	end
	
	private
	
	def generate_random(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while Subscription.exists?(column => self[column])
	end
	
end

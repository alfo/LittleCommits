class SubscriptionsMailer < ActionMailer::Base
  default from: "Little Commits <#{ENV['EMAIL_ADDRESS']}>"
  
  def new_subscription(subscription)
  	@subscription = subscription
  	
  	@endpoint = endpoint_path(:token => @subscription.token)
  	
  	mail(:to => "#{@subscription.email}", :subject => "Little Commits Setup")
  end
end

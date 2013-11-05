class SubscriptionsMailer < ActionMailer::Base
  default from: "Little Commits <#{ENV['EMAIL_ADDRESS']}>"
  
  def new_subscription(subscription)
  	@subscription = subscription
  	
  	domain = "http://little-commits.herokuapp.com"
  	
  	@endpoint = domain + endpoint_path(:token => @subscription.token)
  	
  	mail(:to => "#{@subscription.email}", :subject => "Little Commits Setup")
  end
end

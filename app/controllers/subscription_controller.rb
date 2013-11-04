class SubscriptionController < ApplicationController
  def create
  	config = JSON.parse(params[:config])
    subscription_id = params[:subscription_id]
    endpoint = params[:endpoint]
    
    response = {}
	response[:errors] = []
	response[:valid] = true
  
	if params[:config].nil?
    	return 400, "You did not post any config to validate"
	end
	
	if user_settings['email'].nil? or user_settings['email']==""
    	response[:valid] = false
		response[:errors].push('Please supply your email address to get started.')
	else
		email = EmailVeracity::Address.new(user_settings['email'])
		
		unless email.valid?
			response[:valid] = false
			response[:errors].push('Please supply a valid email address.')
		end
	end
	
	if response[:valid]?
		
		subscription = Subscription.find_or_initialize_by_email(user_settings['email'])
		subscription.bergcloud_subscription_id = subscription_id
		subscription.bergcloud_endpoint = endpoint
		
		subscription.save!
		
	end
	
	render :json => response.to_json
	
  end
end

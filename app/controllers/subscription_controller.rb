class SubscriptionController < ApplicationController

	skip_before_filter :verify_authenticity_token

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
	
	if config['email'].nil? or config['email'].empty?
	
    	response[:valid] = false
		response[:errors].push('Please supply your email address to get started.')
	
	else
	
		email = EmailVeracity::Address.new(config['email'])
		
		unless email.valid?
			response[:valid] = false
			response[:errors].push('Please supply a valid email address.')
		end
	
	end
	
	if response[:valid] == true
		
		subscription = Subscription.find_or_initialize_by(:email => config['email'])
		subscription.bergcloud_subscription_id = subscription_id
		subscription.bergcloud_endpoint = endpoint
		
		unless subscription.save
			response[:valid] = false
			response[:errors].push('There was a problem creating your subscription.')
		end
		
	end
	
	render :json => response.to_json
	
  end
  

end

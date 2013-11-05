require 'ostruct'

class EditionsController < ApplicationController

	skip_before_filter :verify_authenticity_token

	def create
		
		subscription = Subscription.where(:token => params[:token])
		
		# Get info from POST params
		push = JSON.parse(params[:payload])
		
		# Extract datails
		repo = push["repository"]["name"]
		commit = push["commits"].last
		
		# Create a struct for the ERB parsing
		namespace = OpenStruct.new(
			:message => commit["message"],
			:id => commit["id"],
			:name => commit["author"]["name"],
			:username => commit["author"]["username"],
			:date => Time.parse(commit["timestamp"]).strftime('%l:%m:%S%P %Z %e/%m/%y')
		)
		
		# Read the view file into a variable
		erb = File.read "#{Rails.root}/app/views/editions/create.html.erb"
		
		# Parse the ERB
		html = ERB.new(erb).result(namespace.instance_eval { binding })
		
		# OAuth stuff
		consumer = OAuth::Consumer.new(ENV['CONSUMER_TOKEN'], ENV['CONSUMER_SECRET'])
		access_token = OAuth::AccessToken.new(consumer, ENV['ACCESS_TOKEN'], ENV['ACCESS_TOKEN_SECRET'], :site => "http://api.bergcloud.com")
		
		# Send the request
		response = access_token.post(subscription.bergcloud_endpoint, html, "Content-Type" => "text/html; charset=utf-8")
		
		if response.code == "410"
			# The user has unsubscribed, so delete the local record of the subscription
			subscription.destroy
		end
		
		# Not received by anyone
		render :text => 'Done'
	
	end

end

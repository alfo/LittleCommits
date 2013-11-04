LittleCommits::Application.routes.draw do
  post "validate_config", :to => "subscription#create"
  get "endpoint"m :to => "edition#create"
end

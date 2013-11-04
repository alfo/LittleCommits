LittleCommits::Application.routes.draw do
  post "validate_config", :to => "subscription#create"
  get "endpoint", :to => "edition#create"
end

LittleCommits::Application.routes.draw do
  post "validate_config", :to => "subscription#create"
  get "endpoint/:token", :to => "edition#create", :as => "endpoint"
end

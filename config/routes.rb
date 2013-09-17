Me::Application.routes.draw do
  
  resources :products

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'products#index'

end

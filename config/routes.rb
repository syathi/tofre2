Rails.application.routes.draw do
  resources :lists
  resources :replies
  
  devise_for :users
  root 'top#index'
  get 'top/show'
  resources :events do
    member {get "addition"}
  end
  resources :donuts do
    collection {get "search", "myfavo", "mydonut"}
    member {get "fab","unfab"}
  end
  resources :refrigerators do
    collection {get "delete"}
    member {get "switching"}
  end
  resources :top do
    member {get "follow","nofollow","refollow","norefollow","block"}
  end
  resources :bulletin_boards

  get '*anything' => 'errors#routing_error'
end
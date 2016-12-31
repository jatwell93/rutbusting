Rails.application.routes.draw do
  
  mount Thredded::Engine => '/forum'

  resources :tasks do
    post :update_row_order, on: :collection
  end
  
  resources :conversations do
    resources :messages
  end
  
  resources :post_attachments
  
  devise_for :users
  resources :locations do 
    collection do
      get 'search'
    end
    resources :reviews, except: [:show, :index]
  end
  
  root 'pages#home'
  get '/home', to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/faq', to: 'pages#faq'
  get "sitemap" => "sitemap#show", format: :xml, as: :sitemap
  get "sitemap/users" => "sitemap#index"
  get 'users', to: 'users#index'  
  

end

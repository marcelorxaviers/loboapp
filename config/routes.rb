Loboapp::Application.routes.draw do

  devise_for :users

  authenticated :user do
    resources :companies do
      get "join"
      get "leave"
      resources :contacts do
        get "highrise_add"
        get "highrise_remove"
      end
    end
    root :to => 'user#home', as: :authenticated_root
  end

  unauthenticated do
    root :to => "home#index", as: :unauthenticated_root
  end

end

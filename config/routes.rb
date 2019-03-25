Rails.application.routes.draw do
  resources :characters do
      get 'character/:id' => 'characters#show'
    end
  resources :starships do
      get 'starships/:id' => 'starships#show'
    end
  resources :planets do
        get 'starships/:id' => 'starships#show'
    end
  resources :films do
    get 'films/:id' => 'films#show'
  end
  root 'welcome#index'
end

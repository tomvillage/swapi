Rails.application.routes.draw do
  get 'starships/index'
  get 'planets/index'
  get 'films/index'
  get 'characters/index'
  root 'welcome#index'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'index#index'
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  get 'parent/:id', to: 'parent#show'
  get 'parent', to: 'parent#search'
  get 'edit_profile', to: 'parent#edit'
  post 'edit_profile', to: 'parent#update'
  get 'job/:id', to: 'job#show'
  post 'new_job', to: 'job#create'
  get 'new_job', to: 'job#new'
  get 'job', to: 'job#search'
  post 'chat/send', to: 'chat#send_message'
  get 'messages', to: 'chat#list'
  get 'chat/:id', to: 'chat#chat'
end

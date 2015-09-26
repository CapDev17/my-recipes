Rails.application.routes.draw do

root 'pages#home'
#root 'welcome#index'

 get '/home', to: 'pages#home'

end
Rails.application.routes.draw do
  root "welcome#index"
  get '/suggested-sentences', to: 'sentences#index'
end

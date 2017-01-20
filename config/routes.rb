Rails.application.routes.draw do
  root 'static#home'

  # TODO: stub for devise login
  get '/login', to: 'static#login'
end

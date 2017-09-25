Rails.application.routes.draw do
  root 'pages#home'

  mount Blazer::Engine, at: "blazer"
end

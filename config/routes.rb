Rails.application.routes.draw do
  resources :verticals do
    resources :categories
  end
end

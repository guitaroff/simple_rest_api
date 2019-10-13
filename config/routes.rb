Rails.application.routes.draw do
  resources :verticals do
    resources :categories
  end

  get    'categories/:category_id/courses',     to: 'courses#index',   as: :courses
  get    'categories/:category_id/courses/:id', to: 'courses#show',    as: :course
  post   'categories/:category_id/courses',     to: 'courses#create',  as: :add_course
  patch  'categories/:category_id/courses/:id', to: 'courses#update',  as: :update_course
  delete 'categories/:category_id/courses/:id', to: 'courses#destroy', as: :remove_course
end

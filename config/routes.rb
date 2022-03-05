Rails.application.routes.draw do
  resources :courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get  '/search'
  # root to: 'course#search'
  # get  'search', to: 'course#search'
  root 'course#search'
  get  'search', to: 'course#search'
end

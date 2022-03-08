Rails.application.routes.draw do
  resources :courses

  get('/', { controller: 'courses', action: 'search', as: 'home' })

  get('/courses/results/query', { controller: 'courses', action: 'results', as: 'results' })

  post('/reviews', { controller: 'reviews', action: 'create' })

  get('/users/new', { controller: 'users', action: 'new' })

  post('/users', { controller: 'users', action: 'create' })

  get('/users/login', { controller: 'users', action: 'login' })

  post('/users/sign_in', { controller: 'users', action: 'sign_in' })
end

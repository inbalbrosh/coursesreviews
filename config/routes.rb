Rails.application.routes.draw do
  devise_for :users
  # resources :courses

  root to: 'courses#search'

  get('/courses', { controller: 'courses', action: 'index' })

  get(
    '/courses/:id',
    { constraints: { id: /[0-9]+(%7C[0-9]+)*/ }, controller: 'courses', action: 'show', as: 'course' }
  )

  get('/', { controller: 'courses', action: 'search', as: 'home' })

  get('/courses/results', { controller: 'courses', action: 'results', as: 'results' })

  post('/reviews', { controller: 'reviews', action: 'create' })

  post('courses/sort', { controller: 'courses', action: 'sort' })

  post('reviews/edit', { controller: 'reviews', action: 'edit', as: 'edit_review' })
end

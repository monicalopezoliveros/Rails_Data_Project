Rails.application.routes.draw do
  get 'static/about'
  resources :cars, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Rutas para Home y About
  root 'cars#index' # O la acción que desees como página principal
  get 'about', to: 'static#about' # Asumiendo que crearás un controlador llamado Static

end

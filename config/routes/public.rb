scope module: :public do
  resources :dog_runs, only: [:index, :show]
  resources :dogs
end
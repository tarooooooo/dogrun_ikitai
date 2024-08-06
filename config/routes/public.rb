scope module: :public do
  resources :dog_runs, only: [:index, :show] do
    resources :stay_periods, only: [:create, :update]
  end
  resources :dogs
end
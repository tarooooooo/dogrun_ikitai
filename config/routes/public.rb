scope module: :public do
  resources :dog_runs, only: [:index, :show] do
    resources :stay_periods, only: [:create, :update]
  end
  resources :dogs

  resources :stay_periods do
    resource :ends_ats, only: [:update], module: :stay_periods
  end
end
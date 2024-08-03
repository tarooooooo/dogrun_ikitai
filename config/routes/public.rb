scope module: :public do
  resources :entries, only: [:show, :create, :new]
end
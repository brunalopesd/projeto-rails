Rails.application.routes.draw do
    resources :generos
    get "filmes/busca", to: "filmes#busca", as: :busca_filme
    resources :filmes, only: [:new, :create, :destroy, :edit, :update]
    root to: "filmes#index"
end
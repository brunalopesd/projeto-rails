Rails.application.routes.draw do
    get "filmes/busca", to: "filmes#busca", as: :busca_filme
    resources :filmes, only: [:new, :create, :destroy]
    root to: "filmes#index"
end

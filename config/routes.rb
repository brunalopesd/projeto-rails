Rails.application.routes.draw do
    resources :generos
    get "filmes/busca", to: "filmes#busca", as: :busca_filme
    get "filmes/minha_lista", to: "filmes#minha_lista", as: :minha_lista
    resources :filmes, only: [:new, :create, :destroy, :edit, :update]
    root to: "filmes#index"
end




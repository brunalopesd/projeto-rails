Rails.application.routes.draw do
    resources :generos
    get "filmes/busca", to: "filmes#busca", as: :busca_filme
    get "filmes/minha_lista", to: "filmes#minha_lista", as: :minha_lista
    post "filmes", to: "filmes#create"
    resources :filmes, only: [:new, :destroy, :edit, :update, :index]
    root to: "filmes#index"
end




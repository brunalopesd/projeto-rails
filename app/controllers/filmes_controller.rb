class FilmesController < ApplicationController
    def index 
        @filmes = Filme.order :nota
        @filmes_com_maior_nota = Filme.order(nota: :asc).limit 2
    end

    def create
        #puts params.require(:filme).permit(:titulo, :atorprincipal, :nota, :ano)
        filme = params.require(:filme).permit(:titulo, :atorprincipal, :nota, :ano)
        Filme.create filme
        redirect_to root_url
    end

    def destroy
        id = params[:id]
        Filme.destroy id
        redirect_to root_url
    end

    def busca
        @titulo = params[:titulo]
        @filmes = Filme.where "titulo like ?", "%#{@titulo}%"
    end
end
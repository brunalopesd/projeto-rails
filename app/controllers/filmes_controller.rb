class FilmesController < ApplicationController
    
    before_action :set_filme, only: [:edit, :update, :destroy]
    
    def index 
        @filmes = Filme.order :nota
        @filmes_com_maior_nota = Filme.order(nota: :desc).limit 2
    end

    def new
        @filme = Filme.new
        @generos = Genero.all
    end

    def edit
       renderiza :edit
    
    end

    def create
        @filme = Filme.new filme_params
        if @filme.save
            flash[:notice] = "Filme salvo com sucesso!"
            redirect_to root_url
        else
            renderiza :new
        end
    end

    def destroy
        @filme.destroy
        redirect_to root_url
    end

    def update 
        if @produto.update filme_params
            flash[:notice] = "Filme atualizado com sucesso!"
            redirect_to root_url
        else
            renderiza :edit
        end
    end

    def busca
        @titulo = params[:titulo]
        @filmes = Filme.where "titulo like ?", "%#{@titulo}%"
    end

    

    private

    def filme_params
        params.require(:filme).permit(:titulo,
        :atorprincipal, :nota, :ano, :genero_id)
    
    end

    def set_filme
        @filme = Filme.find(params[:id])
    end

    def renderiza(view)
        @generos = Genero.all
        render view
    end
end
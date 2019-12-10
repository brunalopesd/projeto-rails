class FilmesController < ApplicationController

    attr_accessor :status

    
    before_action :set_filme, only: [:edit, :update, :destroy]
    
    def index 
        @filmes = Filme.order :nota
         
    end 

    def new
        @filme = Filme.new
        @generos = Genero.all
    end

    def edit
       renderiza :new
    
    end

    def create
        @filme = Filme.new filme_params
        if @filme.save
            flash[:notice] = "Filme salvo com sucesso!"
            redirect_to root_path
        else
            renderiza :new
        end
    end
    
    def destroy
        @filme.destroy
        redirect_to root_path
    end 

    def update 
        if @filme.update filme_params
            flash[:notice] = "Filme atualizado com sucesso!"
            redirect_to root_path
        else
            renderiza :edit
        end
    end

    def busca
        @titulo = params[:titulo]
        @filmes = Filme.where "titulo like ?", "%#{@titulo}%"
    end


    def minha_lista
        @status = params[:status]
        @filme = Filme.where (status == "quero_ver")
    end 


    private

    def filme_params
        params.require(:filme).permit(:titulo,
        :atorprincipal, :nota, :ano, :genero_id, :status)
    
    end
    
    def set_filme
        @filme = Filme.find(params[:id])
    end

    def renderiza(view)
        @generos = Genero.all
        render view
    end

end
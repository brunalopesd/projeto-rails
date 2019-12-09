class Filme < ApplicationRecord


    belongs_to :genero, optional: true
    validates :titulo, :genero, :status, presence: true
    validates :atorprincipal, length: {minimum:4}

    def status_message
        if status == "assisti"
            return "Já assisti"
        
        elsif status == "quero_ver"
            return "Quero Assistir"
        
        else 
            return 
            
        end

    end
end

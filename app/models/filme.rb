class Filme < ApplicationRecord


    belongs_to :genero, optional: true
    
    validates :titulo, presence: true
    validates :atorprincipal, length: {minimum:4}
end

class Genero < ApplicationRecord
    validates :nome, length: {minimum:4}
end

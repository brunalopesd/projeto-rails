class AddGeneroIdToFilme < ActiveRecord::Migration[6.0]
  def change
    add_column :filmes, :genero_id, :integer
  end
end
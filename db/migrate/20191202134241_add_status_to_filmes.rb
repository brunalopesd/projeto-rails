class AddStatusToFilmes < ActiveRecord::Migration[6.0]
  def change
    add_column :filmes, :status, :string
  end
end

class CreateFilmes < ActiveRecord::Migration[6.0]
  def change
    create_table :filmes do |t|
      t.string :titulo
      t.string :atorprincipal
      t.decimal :nota
      t.integer :ano

      t.timestamps
    end
  end
end

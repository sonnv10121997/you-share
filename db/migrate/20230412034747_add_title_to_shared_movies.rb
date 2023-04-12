class AddTitleToSharedMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :shared_movies, :title, :string
  end
end

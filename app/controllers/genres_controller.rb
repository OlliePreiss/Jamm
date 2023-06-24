class GenresController < ApplicationController

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save!
      redirect_to new_genre_path
    else
      flash[:genre_errors] = @genre.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:genre)
  end

end

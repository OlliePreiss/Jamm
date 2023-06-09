class UserGenresController < ApplicationController

  def new
    @usergenre = UserGenre.new
  end

  def create
    @usergenre = UserGenre.new(usergenre_params)
    # @usergenre.user_id = current_user
    if @usergenre.save!
      redirect_to new_user_instrument_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def usergenre_params
    params.require(:user_genre).permit(:user_id, :genre_id)
  end

end

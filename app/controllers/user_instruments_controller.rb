class UserInstrumentsController < ApplicationController

  def new
    @userinstrument = UserInstrument.new
  end

  def create
    @userinstrument = UserInstrument.new(userinstrument_params)
    # @userinstrument.user_id = current_user
    if @userinstrument.save!
      # V2 - redirect to browse matches
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def userinstrument_params
    params.require(:user_instrument).permit(:user_id, :instrument_id)
  end

end

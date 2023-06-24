class InstrumentsController < ApplicationController

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    if @instrument.save!
      redirect_to new_instrument_path
    else
      flash[:instrument_errors] = @instrument.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def instrument_params
    params.require(:instrument).permit(:instrument)
  end

end

class BandSpacesController < ApplicationController
  before_action :set_bandspace, only: [:show, :destroy, :edit, :update]
  def index

    @bandspaces = BandSpace.all
    @markers = @bandspaces.geocoded.map do |bandspace|
      {
        lat: bandspace.latitude,
        lng: bandspace.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {bandspace: bandspace})
      }
    end
  end

  def show
    @booking = Booking.new
  end

  def edit
  end

  def update
    @bandspace.update(bandspace_params)
    redirect_to band_space_path(@bandspace)
  end

  def new
    @bandspace = BandSpace.new
  end

  def create
    @bandspace = BandSpace.new(bandspace_params)
    if @bandspace.save!
      redirect_to band_space_path(@bandspace)
    else
      flash[:bandspace_errors] = @bandspace.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bandspace.destroy
    respond_to do |format|
      format.html { redirect_to band_spaces_url, notice: "Bandspace was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_bandspace
    @bandspace = BandSpace.find(params[:id])
  end

  def bandspace_params
    params.require(:band_space).permit(:name, :description, :price, :address, :capacity, :photo_url, :rating)
  end
end

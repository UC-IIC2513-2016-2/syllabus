class DataEntriesController < ApplicationController
  before_action :require_login

  def new
    @data_entry = DataEntry.new
  end

  def create
    @data_entry = DataEntry.new(data_entry_params)
    if @data_entry.save
      redirect_to new_data_entry_path, notice: 'Se ingresaron los datos correctamente'
    else
      render :new
    end
  end

  private

  def data_entry_params
    params.require(:data_entry).permit(:temperature, :temperature_unit, :latitude, :longitude, :altitude, :outside, :notes)
  end
end

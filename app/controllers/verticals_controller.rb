class VerticalsController < ApplicationController
  before_action :set_vertical, only: [:show, :update, :destroy]

  def index
    @verticals = Vertical.all
    json_response(@verticals)
  end

  def show
    json_response(@vertical)
  end

  def create
    @vertical = Vertical.create!(vertical_params)
    json_response(@vertical, :created)
  end

  def update
    @vertical.update(vertical_params)
    json_response(@vertical, :ok)
  end

  def destroy
    @vertical.destroy
    head :ok
  end

  private

  def set_vertical
    @vertical = Vertical.find(params[:id])
  end

  def vertical_params
    params.require(:vertical).permit(:name)
  end
end

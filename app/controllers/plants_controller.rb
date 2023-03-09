class PlantsController < ApplicationController
  before_action :set_plant, only: %i[show]

  def index
    @plants = Plant.all
    if params[:query].present?
      @plants = @plants.where("name ILIKE ?", "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html
      format.text { render partial: "plants/plants", locals: { plants: @plants}, formats:[:html]}
    end
  end

  def show; end

  def new
    @plants = Plant.all
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:name, :frequency, :outdoor, :last_day, :synonyms)
  end
end

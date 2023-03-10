class GardenPlantsController < ApplicationController
  before_action :set_garden_plant, only: %i[show edit update destroy]

   # create a new plant
  def new
    @garden_plant = GardenPlant.new
    @garden = Garden.find(params[:garden_id])
  end

  # list all gardens
  # def index
  #   if params[:query].present?
  #     sql_query = "name ILIKE :query OR platform ILIKE :query"
  #     @garden_plants = GardenPlants.where(sql_query, query: "%#{params[:query]}%")
  #   else
  #     @garden_plants = GardenPlants.all
  #   end
  # end


  def create
    @garden_plant = GardenPlant.new(garden_plant_params)
    @garden_plant.garden = Garden.find(params[:garden_id])

    if @garden_plant.save
      # @user_garden = UserGarden.create(user_id: current_user.id, garden_id: @garden.id)
      redirect_to garden_path(@garden_plant.garden) #goes into garden
    else
      render "garden_plants/new", status: :unprocessable_entity
    end
  end

  # Show a plant
  def show; end


  # Edit a plant
  def edit; end

  def update
    if @garden_plant.update(garden_plant_params)
      redirect_to garden_path(@garden)
    else
      render "garden_plants/edit", status: :unprocessable_entity
    end
  end

  # Destroy a plant
  def destroy
    @garden_plant.destroy
    redirect_to garden_path(@garden), status: :see_other #change to gardens index
  end

  private

  def garden_plant_params
    params.require(:garden_plant).permit(:name, :photo, :plant_id)
  end

  def set_garden_plant
    @garden_plant = GardenPlant.find(params[:id])
  end

end

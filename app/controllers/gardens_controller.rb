class GardensController < ApplicationController
  before_action :set_garden, only: %i[show edit update destroy]

  # create a new garden
  def new
    @garden = Garden.new
  end

  # fyi id not needed
  def create
    @garden = Garden.new(garden_params)

    if @garden.save
      @user_garden = UserGarden.create(user_id: current_user.id, garden_id: @garden.id)
      redirect_to garden_path(@garden) #goes into garden
    else
      render "gardens/new", status: :unprocessable_entity
    end
  end

  # Show a garden
  def show; end


  # Edit a garden
  def edit; end

  def update
    if @garden.update(garden_params)
      redirect_to garden_path(current_user)
    else
      render "gardens/edit", status: :unprocessable_entity
    end
  end

  # Destroy a garden
  def destroy
    @garden.destroy
    redirect_to user_path(current_user), status: :see_other #change to gardens index
  end

  private

  def garden_params
    params.require(:garden).permit(:name, :location)
  end

  def set_garden
    @garden = Garden.find(params[:id])
  end

end





  # List of all the games available in the app
  # def index
  #   if params[:query].present?
  #     sql_query = "name ILIKE :query OR platform ILIKE :query"
  #     @games = Game.where(sql_query, query: "%#{params[:query]}%")
  #   else
  #     @games = Game.all
  #   end
  # end

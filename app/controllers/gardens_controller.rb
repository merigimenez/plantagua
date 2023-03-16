class GardensController < ApplicationController
  before_action :set_garden, only: %i[show edit update destroy]
  # create a new garden
  def new
    @garden = Garden.new
  end

  # list all gardens
  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR platform ILIKE :query"
      @gardens = Garden.where(sql_query, query: "%#{params[:query]}%")
    else
      @gardens = current_user.gardens
    end
  end


  def create
    @garden = Garden.new(garden_params)

    if @garden.save
      @user_garden = UserGarden.create(user_id: current_user.id, garden_id: @garden.id) #fyi _id and .id not needed
      redirect_to garden_path(@garden) #goes into garden
    else
      render "gardens/new", status: :unprocessable_entity
    end
  end

  # Show a garden
  def show
    @plants = @garden.garden_plants.sort_by{ |element| ((element.last_day + element.plant.frequency[Date.today.strftime("%B").downcase]) - Date.today).to_i }
  end


  # Edit a garden
  def edit; end

  def update
    if @garden.update(garden_params)
      # raise
      if params[:users][:email].present?
        @friend = User.find_by(email: params[:users][:email])
        if @friend
          @user_garden = UserGarden.create!(user_id: @friend.id, garden_id: @garden.id)
          redirect_to garden_path(@garden)
        else
          flash[:info] = "The user has not been found."
          render "gardens/edit", status: :unprocessable_entity
        end
      else
        redirect_to garden_path(@garden)
      end
    else
      render "gardens/edit", status: :unprocessable_entity
    end
  end

  # Destroy a garden
  def destroy
    @garden.destroy
    redirect_to gardens_path, status: :see_other #change to gardens index
  end

  private

  def garden_params
    params.require(:garden).permit(:name, :location)
  end

  def set_garden
    @garden = Garden.find(params[:id])
  end
end

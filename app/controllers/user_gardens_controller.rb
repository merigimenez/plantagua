class UserGardensController < ApplicationController
  def destroy
    UserGarden.find(params[:id]).destroy
    redirect_to gardens_path
  end
end

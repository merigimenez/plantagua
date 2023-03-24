module GardenPlantHelper
  def garden_plant_name(garden_plant)
    if garden_plant.name?
      return garden_plant.name.capitalize
    else
      return garden_plant.plant.name.capitalize
    end
  end
end

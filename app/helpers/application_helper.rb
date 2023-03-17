module ApplicationHelper
  def set_background_class(params)
    if params['controller'] == 'pages' && params['action'] == 'home'
      return 'leaves'
    elsif params['controller'] == "devise/sessions"
      return 'white-hover'
    elsif (params['controller'].in?(["users","gardens","chatrooms"]) && params['action'].in?(['show', 'index'])) || (params['controller'] == "users/registrations" && params['action'].in?(['edit','update']))
      return 'white-solid'
    end
    # raise
  end

  def garden_plant_photo(garden_plant)
    if garden_plant.photo?
      return cl_image_tag garden_plant.photo.key
    else
      return image_tag garden_plant.plant.image
    end
  end

  def garden_plant_name(garden_plant)
    garden_plant.name ? garden_plant.name.capitalize! : garden_plant.plant.name.capitalize!
  end
end

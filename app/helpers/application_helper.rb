module ApplicationHelper
  def set_background_class(params)
    if params['controller'] == 'pages' && params['action'] == 'home'
      return 'leaves'
    elsif params['controller'] == "devise/sessions"
      return 'white-hover'
    elsif (params['controller'].in?(["users","gardens"]) && params['action'] == 'show')|| (params['controller'] == "users/registrations" && params['action'].in?(['edit','update']))
      return 'white-solid'
    end
    # raise
  end
end

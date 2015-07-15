module ApplicationHelper

  def active_class(menu_name)
    menu_name == @active_menu ? 'active' : ''
  end

end

module ApplicationHelper

  def store_name_format(name)
    name.split('_').map(&:capitalize).join(' ')
  end


end

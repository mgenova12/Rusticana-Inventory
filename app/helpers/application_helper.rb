module ApplicationHelper

  def store_name_format(name)
    name.split('_').map(&:capitalize).join(' ')
  end

  def prepcenter 
    Store.find_by(name: params[:store]).label == 'PrepCenter'
  end

  def store
    Store.find_by(name: params[:store]).label == 'Store'
  end

  def status_color(status)
    if status == 'Pending'
      content_tag(:td, 'Pending', class: 'orange')
    else 
      content_tag(:td, 'Complete', class: 'green')
    end
  end

  def out_of_stock_helper(inventory)
    if inventory
      content_tag(:td, 'OUT OF STOCK', class: 'red')
    else 
      content_tag(:td, '')
    end
  end


end

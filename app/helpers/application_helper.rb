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

  def measurement_label(inventory)
    if inventory.store_good.replenish_by_each
      'EA'
    elsif inventory.store_good.product.case_quantity
      'CASE'
    elsif inventory.store_good.measurement == '%'
      inventory.store_good.product.measurement
    else 
      inventory.store_good.measurement
    end
  end

  def prepped_measurement_label(inventory)
    if inventory.store_good.replenish_by_each
      'EA'    
    elsif inventory.store_good.prepcenter_product.case_quantity
      'CASE'
    elsif inventory.store_good.measurement == '%'
        inventory.store_good.prepcenter_product.measurement
    else 
      inventory.store_good.measurement
    end
  end

  def product_sale_total(inventory)
    if inventory.store_good.product 
      if inventory.store_good.replenish_by_each && inventory.store_good.product.case_quantity
        ((inventory.store_good.product.price) * ((inventory.store_good.product.markup * 0.01)+1) / inventory.store_good.product.case_quantity) * inventory.quantity_needed
      else
        (inventory.store_good.product.price) * ((inventory.store_good.product.markup * 0.01)+1) * inventory.quantity_needed
      end
    else inventory.store_good.prepcenter_product
      if inventory.store_good.replenish_by_each && inventory.store_good.prepcenter_product.case_quantity
        ((inventory.store_good.prepcenter_product.product.price / inventory.store_good.prepcenter_product.portion_size) * ((inventory.store_good.prepcenter_product.product.markup * 0.01)+1) / inventory.store_good.prepcenter_product.case_quantity) * inventory.quantity_needed 
      else
        ((inventory.store_good.prepcenter_product.product.price / inventory.store_good.prepcenter_product.portion_size) * ((inventory.store_good.prepcenter_product.product.markup * 0.01)+1)) * inventory.quantity_needed 
      end
    end
  end

  def notification_count
    prepcenter_store_id = Store.find_by(label:'PrepCenter').id
    count = Order.where(status: 'Pending').where.not(store_id: prepcenter_store_id).count
    if count > 0 
      count
    end
  end

  def notification_dropdown
    prepcenter_store_id = Store.find_by(label:'PrepCenter').id
    orders = Order.where(status: 'Pending').where.not(store_id: prepcenter_store_id).reverse

      orders.map do |order|
      store = Store.find(order.store_id)
        content_tag :li do
          content_tag :a, :href => "/trappe/orders/#{order.id}/new" do
            "#{order.order_day} #{store_name_format(store.name)} Order is Pending"
          end
        end        
      end.join("\n").html_safe

  end

  def show_link(object, content = "Show", path)
    link_to(content, path) if can?(:read, object)
  end

  # def edit_link(object, content = "Edit")
  #   link_to(content, [:edit, object]) if can?(:update, object)
  # end

  # def destroy_link(object, content = "Destroy")
  #   link_to(content, object, :method => :delete, :confirm => "Are you sure?") if can?(:destroy, object)
  # end

  def create_link(object, content = "New", path)
    if can?(:create, object)
      # object_class = (object.kind_of?(Class) ? object : object.class)
      link_to(content, path, :class => "btn btn-success")
    end
  end

  def quick_order_format(order)
    if order.order_day == 'Quick Order'
      content_tag(:td, "#{store_name_format(order.store.name)} - Quick Order")
    else 
      content_tag(:td, "#{store_name_format(order.store.name)}")
    end

  end




end

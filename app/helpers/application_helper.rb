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
    if (inventory.store_good.measurement == '%') || inventory.store_good.product.case_quantity
      'CASE'
    else 
      inventory.store_good.measurement
    end
  end

  def prepped_measurement_label(inventory)
    if (inventory.store_good.measurement == '%') || inventory.store_good.prepcenter_product.case_quantity
      'CASE'
    else 
      inventory.store_good.measurement
    end
  end

  def product_sale_total(inventory)
    if inventory.store_good.product
      inventory.store_good.product.price * inventory.quantity_needed
    else 
       (inventory.store_good.prepcenter_product.product.price / inventory.store_good.prepcenter_product.portion_size) * ((inventory.store_good.prepcenter_product.product.markup * 0.01)+1) * inventory.quantity_needed 
    end
  end

  def notification_count
    count = Order.where(status: 'Pending').count
    if count > 0 
      count
    end
  end

  def notification_dropdown
    orders = Order.where(status: 'Pending').reverse

      orders.map do |order|
      store = Store.find(order.store_id)
        content_tag :li do
          content_tag :a, :href => "/trappe/orders/#{order.id}/new" do
            "#{order.order_day} #{store_name_format(store.name)} Order is Pending"
          end
        end        
      end.join("\n").html_safe

  end


end

class QuickOrdersController < ApplicationController
  authorize_resource :class => false
  
  def index 
      store_id = Store.find_by(name: params[:store]).id 
      @quick_products = QuickProduct.where(quantity_needed: nil, store_id: store_id)
      @quick_product = QuickProduct.new
  end

  def create 
    store_id = Store.find_by(name: params[:store]).id 
    trappe_id = Distributor.find_by('lower(name) = ?', 'TRAPPE'.downcase).id

    if (Product.search_product(params[:term])) || (PrepcenterProduct.search_product(params[:term]))

      product_ids = Product.where("lower(name) LIKE ?", "%#{params[:term].downcase}%").ids
      if product_ids.length > 0
        product_ids.each do |product_id|
          store_good = StoreGood.find_by(store_id: store_id, product_id: product_id, distributor_id: trappe_id)
          if store_good
            QuickProduct.create!(
              name: store_good.product.name,
              measurement: store_good.product.measurement,
              store_id: store_id
            )
          end
        end
      end

      if PrepcenterProduct.search_product(params[:term])
        product_ids = PrepcenterProduct.where("lower(name) LIKE ?", "%#{params[:term].downcase}%").ids
      
        product_ids.each do |product_id|
          store_good = StoreGood.find_by(store_id: store_id, prepcenter_product_id: product_id, distributor_id: trappe_id)
          if store_good
            QuickProduct.create!(
              name: store_good.prepcenter_product.name,
              measurement: store_good.prepcenter_product.measurement,
              store_id: store_id
            )
          end
        end        
      end
      
      redirect_to "/#{params[:store]}/quick_order"        
    else 
      #Error
      redirect_to "/#{params[:store]}/quick_order"        
    end
  end

  def update 
    store_id = Store.find_by(name: params[:store]).id
    
    order = Order.create!(
      status: 'Pending',
      order_day: 'Quick Order',
      message: nil,
      store_id: store_id
    )

    params[:inventory].each do |inventory|  
      
      QuickProduct.find(inventory[:id]).update!(
        quantity_needed: inventory[:quantity_needed]
      )

      if Product.find_by(name: inventory[:name])
        product_id = Product.find_by(name: inventory[:name]).id
        store_good_id = StoreGood.find_by(store_id: store_id, product_id: product_id).id
        Inventory.create!(
          store_id: store_id,
          quantity: nil,
          order_id: order.id,
          quantity_needed: inventory[:quantity_needed],
          store_good_id: store_good_id
        )
      else 
        prepped_product_id = PrepcenterProduct.find_by(name: inventory[:name]).id
        prepped_store_good_id = StoreGood.find_by(store_id: store_id, prepcenter_product_id: prepped_product_id).id
        Inventory.create!(
          store_id: store_id,
          quantity: nil,
          order_id: order.id,
          quantity_needed: inventory[:quantity_needed],
          store_good_id: prepped_store_good_id
        )
      end

    end
    

    redirect_to "/#{params[:store]}/quick_order"        
  end

  def destroy
    if QuickProduct.find_by(id: params[:id])
      quick_order = QuickProduct.find(params[:id])
      quick_order.destroy
    end


    redirect_to "/#{params[:store]}/quick_order"
  end

end

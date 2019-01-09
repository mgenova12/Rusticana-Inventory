class QuickOrdersController < ApplicationController

  def index 
      @quick_products = QuickProduct.where(quantity_needed: nil)
      @quick_product= QuickProduct.new
  end

  def create 
      store_id = Store.find_by(name: params[:store]).id 

      if Product.find_by("name LIKE ?", "%#{params[:term]}%")
        product_ids = Product.where("name LIKE ?", "%#{params[:term]}%").ids

        product_ids.each do |product_id|
          store_good = StoreGood.find_by(store_id: store_id, product_id: product_id)
          if store_good
            QuickProduct.create!(
              name: store_good.product.name,
              measurement: store_good.product.measurement
            )
          end
        end
        redirect_to "/#{params[:store]}/quick_order"

      elsif PrepcenterProduct.find_by("name LIKE ?", "%#{params[:term]}%")
        product_ids = PrepcenterProduct.where("name LIKE ?", "%#{params[:term]}%").ids
      
        product_ids.each do |product_id|
          store_good = StoreGood.find_by(store_id: store_id, prepcenter_product_id: product_id)
          if store_good
            QuickProduct.create!(
              name: store_good.prepcenter_product.name,
              measurement: store_good.prepcenter_product.measurement
            )
          end
        end
        redirect_to "/#{params[:store]}/quick_order"  

      else 
        #ERROR
        redirect_to "/#{params[:store]}/quick_order"        
      end
      

  end

  def update 
    params[:inventory].each do |inventory|
      QuickProduct.find(inventory[:id]).update!(
        quantity_needed: inventory[:quantity_needed]
      )
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

module ProductsHelper

  def measurement_options(product)
    if product.measurement == 'EA'
      options_for_select([["EA", "EA"], ["BIN", "BIN"], ["SLEEVE", "SLEEVE"], ["%", "%"], ["CASE", "CASE"]])
    elsif product.measurement == 'BIN'
      options_for_select([["BIN", "BIN"], ["EA", "EA"], ["SLEEVE", "SLEEVE"], ["%", "%"], ["CASE", "CASE"]])
    elsif product.measurement == 'SLEEVE'
      options_for_select([["SLEEVE", "SLEEVE"], ["BIN", "BIN"], ["EA", "EA"], ["%", "%"], ["CASE", "CASE"]])          
    elsif product.measurement == '%'
      options_for_select([["%", "%"], ["SLEEVE", "SLEEVE"], ["BIN", "BIN"], ["EA", "EA"], ["CASE", "CASE"]])          
    else 
      options_for_select([["CASE", "CASE"],["%", "%"], ["SLEEVE", "SLEEVE"], ["BIN", "BIN"], ["EA", "EA"]])          
    end
  end

  def prepped_options(product)
    if product.prepped
      options_for_select([["Prepped", "true"], ["Not Prepped", "false"]])
    else 
      options_for_select([["Not Prepped", "false"], ["Prepped", "true"]])
    end
  end

  def item_type_options(product)
    if product.item_type == 'dry'
      options_for_select([["Dry", "dry"], ["Refrigerated", "refrigerated"], ["Frozen", "frozen"]])
    elsif product.item_type == 'refrigerated'
      options_for_select([["Refrigerated", "refrigerated"],["Dry", "dry"], ["Frozen", "frozen"]])
    else 
      options_for_select([["Frozen", "frozen"], ["Dry", "dry"], ["Refrigerated", "refrigerated"]])
    end
  end

  def product_distributors_options(product)
    distributor_array = []

      @distributors.each do |distributor| 
        if product.distributor
          if product.distributor == distributor.name
            distributor_array.unshift([distributor.name, distributor.name])
          else 
            distributor_array.push([distributor.name, distributor.name])
          end 
        else 
          if distributor_array.length < 1 
            distributor_array.unshift(["", nil])
            distributor_array.push([distributor.name, distributor.name])
          else 
            distributor_array.push([distributor.name, distributor.name])
          end 
        end
      end

      options_for_select(distributor_array)
  end


  def distributors_options(store_good)
    distributor_array = []

      @distributors.each do |distributor| 
        if store_good.distributor.id
          if store_good.distributor.id == distributor.id
            distributor_array.unshift([distributor.name, distributor.id])
          else 
            distributor_array.push([distributor.name, distributor.id])
          end 
        else 
          if distributor_array.length < 1 
            distributor_array.unshift(["", nil])
            distributor_array.push([distributor.name, distributor.id])
          else 
            distributor_array.push([distributor.name, distributor.id])
          end 
        end
      end

      options_for_select(distributor_array)
  end
      
  def locations_options(store_good)
    location_array = []

      @locations.each do |location| 
        if store_good.location.id
          if store_good.location.id == location.id
            location_array.unshift([location.name, location.id])
          else 
            location_array.push([location.name, location.id])
          end 
        else 
          if location_array.length < 1 
            location_array.unshift(["", nil])
            location_array.push([location.name, location.id])
          else 
            location_array.push([location.name, location.id])
          end 
        end
      end

    options_for_select(location_array)
  end

  def delivery_day_options(product, day)
    if product.delivery_day == day
      check_box_tag 'delivery_day', day, true
    else
      check_box_tag 'delivery_day', day
    end
        
  end



end

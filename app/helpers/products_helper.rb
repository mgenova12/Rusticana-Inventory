module ProductsHelper

  def measurement_options(product)
    if product.measurement == 'EA'
      options_for_select([["EA", "EA"], ["BIN", "BIN"], ["SLEEVE", "SLEEVE"], ["%", "%"]])
    elsif product.measurement == 'BIN'
      options_for_select([["BIN", "BIN"], ["EA", "EA"], ["SLEEVE", "SLEEVE"], ["%", "%"]])
    elsif product.measurement == 'SLEEVE'
      options_for_select([["SLEEVE", "SLEEVE"], ["BIN", "BIN"], ["EA", "EA"], ["%", "%"]])          
    else 
      options_for_select([["%", "%"], ["SLEEVE", "SLEEVE"], ["BIN", "BIN"], ["EA", "EA"]])          
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

  def distributor_options(product)
    dist_array = []

      @distributors.each do |distributor| 
        if product.distributor_id
          if product.distributor_id == distributor.id
            dist_array.unshift([distributor.name, distributor.id])
          else 
            dist_array.push([distributor.name, distributor.id])
          end 
        else 
          if dist_array.length < 1 
            dist_array.unshift(["", nil])
            dist_array.push([distributor.name, distributor.id])
          else 
            dist_array.push([distributor.name, distributor.id])
          end 
        end
      end

      options_for_select(dist_array)
  end
      

end

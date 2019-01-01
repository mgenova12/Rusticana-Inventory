module InventoriesHelper

  def quantity_needed(inventory)
    if inventory[:case_quantity].presence
      case_amount = inventory[:max_amount].to_i - inventory[:quantity].to_i
      case_result = (case_amount.to_f / inventory[:case_quantity].to_f).ceil
      case_result > 0 ? case_result : 0
    elsif inventory[:measurement] == '%'
      percent = (inventory[:quantity].to_i * 0.01)
      percent <= 0.25 ? 1 : 0
    else 
      result = inventory[:max_amount].to_i - inventory[:quantity].to_i
      result > 0 ? result : 0
    end
  end





end

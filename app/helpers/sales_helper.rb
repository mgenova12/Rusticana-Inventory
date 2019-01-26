module SalesHelper

  def paid_format(order)
    if order.paid
      content_tag(:td, 'PAID', class: 'red')
    else 
      content_tag(:td, 'PENDING', class: 'orange')
    end

  end

end

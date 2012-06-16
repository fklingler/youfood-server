class Api::OrderController < Api::ApiController
  def create
    @restaurant = current_device.owner.restaurant
    
    @order = Order.new

    @order.device = current_device

    #@order.table = @restaurant.tables.where(:number => params[:order][:table])
    params[:order][:order_items].each do |order_item|
      debugger
      @order.order_items.create(quantity: order_item[:quantity], product: Product.find(order_item[:product]))
    end

    # if @order.save && current_device.owner_type == 'Table'
    #   #notif push 
    # end

    if @order.save
      respond_to do |format|
        format.all { render :nothing => true, :status => 200 }
      end
    end
  end
end

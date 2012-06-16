class Api::OrderController < Api::ApiController
  def create
    @restaurant = current_device.owner.restaurant
    
    @order = Order.new

    @order.device = current_device

    @order.table = @restaurant.tables.where(:number => params[:order][:table]).first

    params[:order][:order_items].each do |order_item|
      @order.order_items.build(quantity: order_item[:quantity], product: Product.find(order_item[:product]))
    end

    # if @order.save && current_device.owner_type == 'Table'
    #   #notif push
    # end

    if @order.save
      status = 201

      if current_device.owner_type == 'Table'
        send_c2dm_notification
      end
    else
      status = 500
    end

    render :nothing => true, :status => status
  end

  protected
  def send_c2dm_notification

  end
  handle_asynchronously :send_c2dm_notification
end

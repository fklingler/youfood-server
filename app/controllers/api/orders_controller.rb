class Api::OrdersController < Api::ApiController
  def index
    unless current_device.owner_type == 'Waiter' && current_device.owner.zone
      render :nothing => true, :status => 401
      return
    end

    logger.debug current_device.owner.zone.tables.to_json

    @orders = Order.all
    @orders = @orders.where(:table_id.in => current_device.owner.zone.tables.map(&:id))
    @orders = @orders.where(:delivered => false, :paid => false)

    respond_with :api, @orders, :api_template => :public
  end

  def create
    @restaurant = current_device.owner.restaurant
    
    @order = Order.new

    @order.device = current_device

    @order.table = @restaurant.tables.where(:number => params[:order][:table]).first

    params[:order][:order_items].each do |order_item|
      @order.order_items.create(quantity: order_item[:quantity], product: Product.find(order_item[:product]))
    end

    if @order.save
      status = 201

      if current_device.owner_type == 'Table' && current_device.owner.zone && current_device.owner.zone.waiter && current_device.owner.zone.waiter.device.registration_id

        send_c2dm_notification(:registration_id => current_device.owner.zone.waiter.device.registration_id,
                               :collapse_key    => "order",
                               :table           => current_device.owner.number)
      end
    else
      status = 500
    end

    render :nothing => true, :status => status
  end

  protected
  def send_c2dm_notification(options = {})
    require "net/http"
    require "net/https"

    SpeedyC2DM::API.send_notification(options)
  end
end

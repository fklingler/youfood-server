class Api::OrdersController < Api::ApiController
  def index
    @orders = Order.all

    if current_device.owner_type == 'Waiter'
      @orders = @orders.where(:table_id.in => current_device.owner.zone.tables.map(&:id))
      @orders = @orders.or({:delivered => false}, {:paid => false})
    elsif current_device.owner_type == 'Table'
      @orders = @orders.where(:table_id => current_device.owner.id)
      @orders = @orders.where(:paid => false)
    end

    respond_with :api, @orders, :api_template => :public
  end

  def update
    @order = Order.find(params[:id])

    if @order.update_attributes(params[:order])
      status = 200
    else
      status = 500
    end

    render :nothing => true, :status => status
  end

  def create
    @restaurant = current_device.owner.restaurant
    
    @order = Order.new

    @order.device = current_device

    if current_device.owner_type == 'Table'
      @order.table = current_device.owner
    else
      @order.table = @restaurant.tables.where(:number => params[:order][:table]).first
    end

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

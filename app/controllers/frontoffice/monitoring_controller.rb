class Frontoffice::MonitoringController < Frontoffice::FrontofficeController
  def index
    @orders = Order.all

    @orders = @orders.where

    unless (params[:restaurant].blank?)
      restaurant = Restaurant.find_by_slug(params[:restaurant])
      tables = Table.where(:zone_id.in => restaurant.zones.map(&:_id)) 
      @orders = @orders.where(:table_id.in => tables.map(&:_id))
    end

    unless (params[:product_type].blank?)
      product_type = ProductType.find_by_slug(params[:product_type])
      @orders = @orders.where(
                  "order_items" => {
                    "$elemMatch" => {
                      "product_id" => {
                        "$in" => product_type.products.map(&:_id)
                      }}})
    end
  end
end

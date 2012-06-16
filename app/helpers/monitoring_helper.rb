module MonitoringHelper
  def last_months (x)
    6.downto(0).each do |i|
      yield(Date.today - i.month)
    end
  end

  def count_between_dates (orders, interval)
    orders = orders.where(:created_at.gte => interval.first.to_time, :created_at.lte => interval.last.end_of_day.to_time)

    total_count(orders)
  end

  def total_count (orders)
    if !params[:display].blank? && params[:display] == 'products'
      product_type = ProductType.find_by_slug(params[:product_type]) if params[:product_type]

      count = 0
      orders.each do |order|
        order.order_items.each do |order_item|
          count += order_item.quantity unless product_type && order_item.product.product_type != product_type
        end
      end
      count
    else
      orders.count
    end
  end
end

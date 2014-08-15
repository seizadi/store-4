class Order < ActiveRecord::Base

  def self.chart_data(start = 3.weeks.ago)
    total_prices = prices_by_day(start)
    shipping_prices = where(shipping: true).prices_by_day(start)
    download_prices = where(shipping: false).prices_by_day(start)
    total_values = Array.new 
    shipping_values = Array.new
    download_values = Array.new
    (start.to_date..Date.today).map do |date| 
      t =  Time.send(:gm, date.year, date.month, date.day, 0,0,0,0).to_i
      total_values.push [ t , total_prices[date] || 0 ] 
      shipping_values.push [ t, shipping_prices[date] || 0 ]
      download_values.push [ t, download_prices[date] || 0 ]
    end

    [
      { key: "Total", bar: false, 
        values: total_values
      }, 
      { 
        key: "Shipped", bar: false, 
        values: shipping_values
      }, 
      { 
        key: "Download", bar: false, 
        values: download_values
      } 
    ]
  end

  def self.prices_by_day(start)
    orders = where(purchased_at: start.beginning_of_day..Time.zone.now)
    orders = orders.group("date(purchased_at)")
    orders = orders.select("purchased_at, sum(price) as total_price")
    orders.each_with_object({}) do |order, prices|
      prices[order.purchased_at.to_date] = order.total_price
    end
  end
end

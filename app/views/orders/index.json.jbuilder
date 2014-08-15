json.array!(@orders) do |order|
  json.extract! order, :id, :price, :shipping, :purchased_at
  json.url order_url(order, format: :json)
end

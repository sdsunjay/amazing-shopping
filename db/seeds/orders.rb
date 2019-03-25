require 'csv'
# "id","product_id","inventory_id","street_address","apartment","city","state","country_code","zip","phone_number","email","name","order_status","payment_ref","transaction_id","payment_amt_cents","ship_charged_cents","ship_cost_cents","subtotal_cents","total_cents","shipper_name","payment_date","shipped_date","tracking_number","tax_total_cents","created_at","updated_at"
csv_text = File.read(Rails.root.join('lib', 'seeds', 'orders.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
p  " loading # { orders.csv } ... "
csv.each do |row|
  t = Order.new
  t.id = row['id']
  t.product_id = row['product_id']
  t.inventory_id = row['inventory_id']
  t.street_address = row['street_address']
  t.apartment = row['apartment']
  t.city = row['city']
  t.state = row['state']
  t.country_code = row['country_code']
  t.zip = row['zip']
  t.phone_number = row['phone_number']
  t.email = row['email']
  t.name = row['name']
  t.status = row['order_status']
  t.payment_ref = row['payment_ref']
  t.transaction_id = row['transaction_id']
  t.payment_amt_cents = row['payment_amt_cents']
  t.ship_charged_cents = row['ship_charged_cents']
  t.ship_cost_cents = row['ship_cost_cents']
  t.subtotal_cents = row['subtotal_cents']
  t.total_cents = row['total_cents']
  t.shipper_name = row['shipper_name']
  t.payment_date = row['payment_date']
  t.shipped_date = row['shipped_date']
  t.tracking_number = row['tracking_number']
  t.tax_total_cents = row['tax_total_cents']
  t.created_at = row['created_at']
  t.updated_at = row['updated_at']
  t.save
  # puts "#{t.id} saved"
end
puts "There are now #{Order.count} rows in the Orders table"

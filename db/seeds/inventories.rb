
require 'csv'
require 'time'
# "id","product_id","quantity","color","size","weight","price_cents","sale_price_cents","cost_cents","sku","length","width","height","note"
csv_text = File.read(Rails.root.join('lib', 'seeds', 'inventories.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
p  " loading # { inventories.csv } ... "
csv.each do |row|
  t = Inventory.new
  t.id = row['id']
  t.product_id = row['product_id']
  t.quantity = row['quantity']
  t.color = row['color']
  t.size = row['size']
  t.weight = row['weight']
  t.price_cents = row['price_cents']
  t.sale_price_cents = row['sale_price_cents']
  t.cost_cents = row['cost_cents']
  t.sku = row['sku']
  t.length = row['length']
  t.width = row['width']
  t.height = row['height']
  t.note = row['note']
  t.created_at = Time.now
  t.updated_at = Time.now
  t.save
  # puts "#{t.id} saved"
end
puts "There are now #{Inventory.count} rows in the Inventories table"

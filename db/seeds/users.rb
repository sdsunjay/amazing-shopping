require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'users.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
p  " loading # { users.csv } ... "
csv.each do |row|
  t = User.new
  t.id = row['id']
  t.name = row['name']
  t.email = row['email']
  t.password = row['password_plain']
  t.superadmin= row['superadmin']
  t.shop_name = row['shop_name']
  t.created_at = row['created_at']
  t.updated_at = row['updated_at']
  t.card_brand = row['card_brand']
  t.card_last_four = row['card_last_four']
  t.trial_ends_at = row['trial_ends_at']
  t.shop_domain = row['shop_domain']
  t.is_enabled = row['is_enabled']
  t.billing_plan = row['billing_plan']
  t.trial_starts_at = row['trial_starts_at']
  t.save
  # puts "#{t.name}, #{t.email} saved"
end
puts "There are now #{User.count} rows in the Users table"

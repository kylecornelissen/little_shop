
Order.destroy_all
OrderItem.destroy_all
Item.destroy_all
User.destroy_all

admin_1 = User.create!(email: "megan@littleshop.com", password: "password", role: 2, active: true, name: "Megan", street: "1234 Zebra St", city: "Denver", state: "CO", zip: '90210')
admin_2 = User.create!(email: "brian@littleshop.com", password: "password", role: 2, active: true, name: "Brian", street: "1234 Wahoo Way", city: "Denver", state: "CO", zip: '90210')

merchant_1 = User.create!(email: "alex@gmail.com", password: "password", role: 1, active: true, name: "Alex", street: "1234 Protein Pl", city: "Burlington", state: "VT", zip: '64086')
merchant_2 = User.create!(email: "aurie@gmail.com", password: "password", role: 1, active: true, name: "Aurie", street: "1234 Codeislife Ct", city: "Boulder", state: "CO", zip: '64086')
merchant_3 = User.create!(email: "kyle@gmail.com", password: "password", role: 1, active: true, name: "Kyle", street: "1234 Roadrunner Rd", city: "Springfield", state: "VA", zip: '64086')
merchant_4 = User.create!(email: "patrick@gmail.com", password: "password", role: 1, active: true, name: "Patrick", street: "1234 Boilermaker Blvd", city: "West Lafayette", state: "IN", zip: '64086')

buyer_1 = User.create!(email: 'buyer1@gmail.com', password: 'password', active: true, name: 'Buyer 1', street: '1234 Test Dr', city: 'Denver', state: 'CO', zip: '80123', role: 0)
buyer_2 = User.create!(email: 'buyer2@gmail.com', password: 'password', active: true, name: 'Buyer 2', street: '1234 Test Dr', city: 'New York', state: 'NY', zip: '80123', role: 0)
buyer_3 = User.create!(email: 'buyer3@gmail.com', password: 'password', active: true, name: 'Buyer 3', street: '1234 Test Dr', city: 'Kansas City', state: 'KS', zip: '80123', role: 0)
buyer_4 = User.create!(email: 'buyer4@gmail.com', password: 'password', active: true, name: 'Buyer 4', street: '1234 Test Dr', city: 'Colorado Springs', state: 'CO', zip: '80123', role: 0)
buyer_5 = User.create!(email: 'buyer5@gmail.com', password: 'password', active: true, name: 'Buyer 5', street: '1234 Test Dr', city: 'Los Angeles', state: 'CA', zip: '80123', role: 0)
buyer_6 = User.create!(email: 'buyer6@gmail.com', password: 'password', active: true, name: 'Buyer 6', street: '1234 Test Dr', city: 'Kansas City', state: 'MO', zip: '80123', role: 0)
buyer_7 = User.create!(email: 'buyer7@gmail.com', password: 'password', active: true, name: 'Buyer 7', street: '1234 Test Dr', city: 'Grand Forks', state: 'ND', zip: '80123', role: 0)

address_11 = Address.create!(name: 'home', street: '1234 Test Dr', city: 'Denver', state: 'CO', zip: '80123', user: buyer_1)
address_12 = Address.create!(name: 'work', street: '2345 Test Dr', city: 'Colorado Springs', state: 'CO', zip: '80123', user: buyer_1)
address_21 = Address.create!(name: 'home', street: '1234 Test Dr', city: 'New York', state: 'NY', zip: '80123', user: buyer_2)
address_22 = Address.create!(name: 'work', street: '2345 Test Dr', city: 'Boston', state: 'MA', zip: '80123', user: buyer_2)
address_31 = Address.create!(name: 'home', street: '1234 Test Dr', city: 'Kansas City', state: 'KS', zip: '80123', user: buyer_3)
address_41 = Address.create!(name: 'home', street: '1234 Test Dr', city: 'Colorado Springs', state: 'CO', zip: '80123', user: buyer_4)
address_42 = Address.create!(name: 'work', street: '2345 Test Dr', city: 'Salt Lake City', state: 'UT', zip: '80123', user: buyer_4)
address_43 = Address.create!(name: "grandma's place", street: '3456 Test Dr', city: 'Colorado Springs', state: 'CO', zip: '80123', user: buyer_4)
address_51 = Address.create!(name: 'home', street: '1234 Test Dr', city: 'Los Angeles', state: 'CA', zip: '80123', user: buyer_5)
address_52 = Address.create!(name: 'work', street: '2345 Test Dr', city: 'San Francisco', state: 'CA', zip: '80123', user: buyer_5)
address_61 = Address.create!(name: 'home', street: '1234 Test Dr', city: 'Kansas City', state: 'MO', zip: '80123', user: buyer_6)
address_62 = Address.create!(name: 'work', street: '2345 Test Dr', city: 'Kansas City', state: 'MO', zip: '80123', user: buyer_6)


mike = Item.create!(name: 'Mike Trout', active: true, price: 11.00, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/51GOReQ-ckL.jpg', inventory: 168, user: merchant_1)
max = Item.create!(name: 'Max Scherzer', active: true, price: 12.50, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/51Q%2Bv6TFHZL.jpg', inventory: 140, user: merchant_3)
clayton = Item.create!(name: 'Clayton Kershaw', active: true, price: 13.00, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/51sOKiT8jwL._SY445_.jpg', inventory: 160, user: merchant_2)
nolan = Item.create!(name: 'Nolan Arenado', active: true, price: 14.44, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/41zv0W8xOsL.jpg', inventory: 150, user: merchant_4)
derek = Item.create!(name: 'Derek Jeter', active: true, price: 18.46, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/61y8sAnxTML._SY606_.jpg', inventory: 130, user: merchant_1)
tony = Item.create!(name: 'Tony Gwynn', active: true, price: 21.00, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/5107DHIW6OL._SY445_.jpg', inventory: 60, user: merchant_2)
ken = Item.create!(name: 'Ken Griffey', active: true, price: 23.05, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/51JtJOXCAnL.jpg', inventory: 24, user: merchant_4)
cal = Item.create!(name: 'Cal Ripken', active: true, price: 28.08, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/51h0J4aUSoL._SY445_.jpg', inventory: 88, user: merchant_3)
ryan = Item.create!(name: 'Nolan Ryan', active: true, price: 38.30, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/51Mxd3NY6tL.jpg', inventory: 33, user: merchant_1)
jackie = Item.create!(name: 'Jackie Robinson', active: true, price: 42.00, description: 'item_description', image: 'https://i.ebayimg.com/images/g/CDsAAOSwJo5a-Otk/s-l640.jpg', inventory: 42, user: merchant_2)
willie = Item.create!(name: 'Willie Mays', active: true, price: 47.80, description: 'item_description', image: 'http://www.vintagecardprices.com/pics/68802.jpg', inventory: 9, user: merchant_3)
shoeless = Item.create!(name: 'Shoeless Joe Jackson', active: true, price: 64.22, description: 'item_description', image: 'https://www.gfg.com/baseball/jjlarge.jpg', inventory: 12, user: merchant_4)
hank = Item.create!(name: 'Hank Aaron', active: true, price: 66.71, description: 'item_description', image: 'https://i.ebayimg.com/images/g/FNwAAOSwAaJaHxUc/s-l640.jpg', inventory: 4, user: merchant_1)
babe = Item.create!(name: 'Babe Ruth', active: true, price: 71.70, description: 'item_description', image: 'http://content.propertyroom.com/listings/sellers/seller600044/images/homeimgs/600044_1562018161712114.jpg', inventory: 3, user: merchant_2)
mickey = Item.create!(name: 'Mickey Mantle', active: true, price: 113.00, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/51CHfNJEAkL._SY445_.jpg', inventory: 5, user: merchant_3)
honus = Item.create!(name: 'Honus Wagner', active: true, price: 312.00, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/51SU9b9GoCL._SY445_.jpg', inventory: 1, user: merchant_4)

order_1 = Order.create!(address: address_11, user: buyer_1, status: 0)
order_2 = Order.create!(address: address_21, user: buyer_2, status: 1, created_at: 3.days.ago, updated_at: 1.days.ago)
order_3 = Order.create!(address: address_31, user: buyer_3, status: 0)
order_4 = Order.create!(address: address_41, user: buyer_4, status: 2, created_at: 9.days.ago, updated_at: 1.days.ago)
order_5 = Order.create!(address: address_51, user: buyer_5, status: 0)
order_6 = Order.create!(address: address_11, user: buyer_1, status: 2, created_at: 5.days.ago, updated_at: 1.days.ago)
order_7 = Order.create!(address: address_21, user: buyer_2, status: 3, created_at: 9.days.ago, updated_at: 1.days.ago)
order_8 = Order.create!(address: address_31, user: buyer_3, status: 0)
order_9 = Order.create!(address: address_41, user: buyer_4, status: 2, created_at: 2.days.ago, updated_at: 1.days.ago)
order_10 = Order.create!(address: address_51, user: buyer_5, status: 2, created_at: 4.days.ago, updated_at: 1.days.ago)
order_11 = Order.create!(address: address_11, user: buyer_1, status: 2, created_at: 4.days.ago, updated_at: 1.days.ago)
order_12 = Order.create!(address: address_21, user: buyer_2, status: 2, created_at: 2.days.ago, updated_at: 1.days.ago)
order_13 = Order.create!(address: address_31, user: buyer_3, status: 2, created_at: 2.days.ago, updated_at: 1.days.ago)
order_14 = Order.create!(address: address_41, user: buyer_4, status: 2, created_at: 6.days.ago, updated_at: 1.days.ago)
order_15 = Order.create!(address: address_51, user: buyer_5, status: 2, created_at: 3.days.ago, updated_at: 1.days.ago)
order_16 = Order.create!(address: address_31, user: buyer_3, status: 2, created_at: 9.days.ago, updated_at: 1.days.ago)
order_17 = Order.create!(address: address_31, user: buyer_3, status: 2, created_at: 6.days.ago, updated_at: 1.days.ago)
order_18 = Order.create!(address: address_31, user: buyer_3, status: 2, created_at: 4.days.ago, updated_at: 1.days.ago)
order_19 = Order.create!(address: address_21, user: buyer_2, status: 2, created_at: 7.days.ago, updated_at: 1.days.ago)
order_20 = Order.create!(address: address_21, user: buyer_2, status: 2, created_at: 3.days.ago, updated_at: 1.days.ago)

order_item_1 = OrderItem.create!(item: max, order: order_1, quantity: 12, price: max.price, fulfilled: false)
order_item_2 = OrderItem.create!(item: clayton, order: order_2, quantity: 2, price: clayton.price, fulfilled: false)
order_item_3 = OrderItem.create!(item: mike, order: order_3, quantity: 3, price: mike.price, fulfilled: false)
order_item_4 = OrderItem.create!(item: nolan, order: order_4, quantity: 4, price: nolan.price, fulfilled: true, created_at: 4.days.ago, updated_at: 1.days.ago)
order_item_5 = OrderItem.create!(item: mickey, order: order_5, quantity: 5, price: mickey.price, fulfilled: false)
order_item_6 = OrderItem.create!(item: derek, order: order_6, quantity: 6, price: derek.price, fulfilled: true, created_at: 7.days.ago, updated_at: 1.days.ago)
order_item_7 = OrderItem.create!(item: tony, order: order_7, quantity: 2, price: tony.price, fulfilled: true, created_at: 3.days.ago, updated_at: 1.days.ago)
order_item_8 = OrderItem.create!(item: ken, order: order_1, quantity: 3, price: ken.price, fulfilled: false)
order_item_9 = OrderItem.create!(item: cal, order: order_2, quantity: 4, price: cal.price, fulfilled: false)
order_item_10 = OrderItem.create!(item: ryan, order: order_7, quantity: 9, price: ryan.price, fulfilled: true, created_at: 4.days.ago, updated_at: 1.days.ago)
order_item_11 = OrderItem.create!(item: babe, order: order_4, quantity: 1, price: babe.price, fulfilled: true, created_at: 7.days.ago, updated_at: 1.days.ago)
order_item_12 = OrderItem.create!(item: hank, order: order_5, quantity: 2, price: hank.price, fulfilled: false)
order_item_13 = OrderItem.create!(item: shoeless, order: order_6, quantity: 3, price: shoeless.price, fulfilled: true, created_at: 8.days.ago, updated_at: 1.days.ago)
order_item_14 = OrderItem.create!(item: willie, order: order_7, quantity: 4, price: willie.price, fulfilled: true, created_at: 2.days.ago, updated_at: 1.days.ago)
order_item_15 = OrderItem.create!(item: jackie, order: order_1, quantity: 9, price: jackie.price, fulfilled: false)
order_item_16 = OrderItem.create!(item: max, order: order_2, quantity: 21, price: max.price, fulfilled: false)
order_item_17 = OrderItem.create!(item: clayton, order: order_3, quantity: 4, price: clayton.price, fulfilled: false)
order_item_18 = OrderItem.create!(item: mike, order: order_4, quantity: 1, price: mike.price, fulfilled: true, created_at: 4.days.ago, updated_at: 1.days.ago)
order_item_19 = OrderItem.create!(item: nolan, order: order_5, quantity: 2, price: nolan.price, fulfilled: false)
order_item_20 = OrderItem.create!(item: derek, order: order_3, quantity: 87, price: derek.price, fulfilled: false)
order_item_21 = OrderItem.create!(item: tony, order: order_6, quantity: 23, price: tony.price, fulfilled: true, created_at: 8.days.ago, updated_at: 1.days.ago)
order_item_22 = OrderItem.create!(item: ken, order: order_2, quantity: 1, price: ken.price, fulfilled: false)
order_item_23 = OrderItem.create!(item: cal, order: order_1, quantity: 6, price: cal.price, fulfilled: false)
order_item_24 = OrderItem.create!(item: ryan, order: order_3, quantity: 3, price: ryan.price, fulfilled: false)
order_item_25 = OrderItem.create!(item: honus, order: order_4, quantity: 1, price: honus.price, fulfilled: true, created_at: 6.days.ago, updated_at: 1.days.ago)

order_item_26 = OrderItem.create!(item: max, order: order_8, quantity: 1, price: max.price, fulfilled: false)
order_item_27 = OrderItem.create!(item: max, order: order_9, quantity: 1, price: max.price, fulfilled: true, created_at: 2.days.ago, updated_at: 1.days.ago)
order_item_28 = OrderItem.create!(item: mike, order: order_10, quantity: 1, price: mike.price, fulfilled: true, created_at: 6.days.ago, updated_at: 1.days.ago)
order_item_29 = OrderItem.create!(item: mike, order: order_11, quantity: 1, price: mike.price, fulfilled: true, created_at: 4.days.ago, updated_at: 1.days.ago)
order_item_30 = OrderItem.create!(item: clayton, order: order_12, quantity: 1, price: clayton.price, fulfilled: true, created_at: 5.days.ago, updated_at: 1.days.ago)
order_item_31 = OrderItem.create!(item: clayton, order: order_13, quantity: 1, price: clayton.price, fulfilled: true, created_at: 3.days.ago, updated_at: 1.days.ago)
order_item_32 = OrderItem.create!(item: nolan, order: order_14, quantity: 1, price: nolan.price, fulfilled: true, created_at: 8.days.ago, updated_at: 1.days.ago)
order_item_33 = OrderItem.create!(item: nolan, order: order_15, quantity: 1, price: nolan.price, fulfilled: true, created_at: 6.days.ago, updated_at: 1.days.ago)
order_item_34 = OrderItem.create!(item: derek, order: order_16, quantity: 1, price: derek.price, fulfilled: true, created_at: 4.days.ago, updated_at: 1.days.ago)
order_item_35 = OrderItem.create!(item: tony, order: order_17, quantity: 1, price: tony.price, fulfilled: true, created_at: 9.days.ago, updated_at: 1.days.ago)
order_item_36 = OrderItem.create!(item: cal, order: order_18, quantity: 1, price: cal.price, fulfilled: true, created_at: 2.days.ago, updated_at: 1.days.ago)
order_item_37 = OrderItem.create!(item: ken, order: order_19, quantity: 1, price: ken.price, fulfilled: true, created_at: 5.days.ago, updated_at: 1.days.ago)
order_item_38 = OrderItem.create!(item: ryan, order: order_20, quantity: 1, price: ryan.price, fulfilled: true, created_at: 4.days.ago, updated_at: 1.days.ago)
order_item_39 = OrderItem.create!(item: honus, order: order_8, quantity: 3, price: honus.price, fulfilled: false)

puts 'seed data finished'
puts "Users created: #{User.count.to_i}"
# puts "Orders created: #{Order.count.to_i}"
puts "Items created: #{Item.count.to_i}"
puts "Orders created: #{Order.count.to_i}"
puts "Order Items created: #{OrderItem.count.to_i}"
# puts "OrderItems created: #{OrderItem.count.to_i}"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('items') 
Category.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('categories')
CategoryItem.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('category_items')
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
Cart.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('carts')
CartItem.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('cart_items') 
Order.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('orders') 
OrderItem.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('order_items')


kitten_pictures_url = ["https://www.sciencesetavenir.fr/assets/img/2019/03/25/cover-r4x3w1000-5c98c40f5bf3d-cat-3535399-1920.jpg", 
"https://images.pexels.com/photos/9413/animal-cute-kitten-cat.jpg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
"https://images.pexels.com/photos/320014/pexels-photo-320014.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
"https://images.pexels.com/photos/45170/kittens-cat-cat-puppy-rush-45170.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
"https://images.pexels.com/photos/96938/pexels-photo-96938.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
"https://images.pexels.com/photos/127028/pexels-photo-127028.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
"https://images.pexels.com/photos/1056251/pexels-photo-1056251.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
"https://images.pexels.com/photos/1444321/pexels-photo-1444321.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
"https://images.pexels.com/photos/257532/pexels-photo-257532.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
"https://images.pexels.com/photos/290204/pexels-photo-290204.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
"https://images.pexels.com/photos/209037/pexels-photo-209037.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
"https://images.pexels.com/photos/1056252/pexels-photo-1056252.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
"https://images.pexels.com/photos/669015/pexels-photo-669015.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
"https://images.pexels.com/photos/2071882/pexels-photo-2071882.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
"https://images.pexels.com/photos/1359307/pexels-photo-1359307.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
"https://images.pexels.com/photos/3250642/pexels-photo-3250642.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
"https://cdn.radiofrance.fr/s3/cruiser-production/2018/06/38dd3787-27c5-4001-a0c8-c87add17328c/870x489_870x489_jeremy_b_williams-r-3e2a7262-modifier.jpg",
"https://images.pexels.com/photos/1416792/pexels-photo-1416792.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
"https://jngnposwzs-flywheel.netdna-ssl.com/wp-content/uploads/2019/05/kitten-2249619_1920-1024x683.jpg",
"https://cdn.pixabay.com/photo/2015/10/12/15/01/cat-984097__340.jpg",
"https://cdn.pixabay.com/photo/2019/08/03/15/05/cat-4381938_960_720.jpg",
"https://cdn.pixabay.com/photo/2014/11/30/14/11/kitty-551554_960_720.jpg"
]

require 'faker'

################# User creation #######################
user = User.new(
  first_name: "admin", 
  last_name: "admin", 
  email: "anthony.phim@gmail.com", 
  password: "123456",
  is_admin: true
)
user.save

puts "admin created"

(0..15).each do |i|
  username = Faker::GreekPhilosophers.name
  lastnameuser = Faker::Creature::Dog.name

  user = User.new(
    first_name: username, 
    last_name: lastnameuser, 
    email:"#{username}.#{lastnameuser}@yopmail.com", 
    password:"AZERTY93",
  )

  user.save
  puts "user seed n°#{i}" 
  #sleep(rand(5..10))
end
################# ITEM creation ##########################

(0..20).each do |i|
  item = Item.new(
  title: Faker::Book.title,
  description: Faker::GreekPhilosophers.quote,
  price: rand(10..55),
  image_url: (kitten_pictures_url[i]),
  )

  item.save
  puts "item seed n°#{i}" 
end

################# CART creation ##########################

(0..15).each do |i|
  cart = Cart.new(
  user_id: i,
  )
  cart.save
  puts "cart seed n°#{i}"
end


################# Cart item ##########################


(0..15).each do |i|
  cartitems = CartItem.new(
 cart_id: i,
 item_id: i,
)


 cartitems.save
 puts "Cart item seed n°#{i}"

end

################# Order creation ##########################


(0..15).each do |i|
  order = Order.new(
    user_id: i,
  )
  order.save
  puts "order seed n°#{i}"
end

################# Order items ##########################

(0..15).each do |i|
  orderitems = OrderItem.new(
 order_id: i,
 item_id: i ,
 )

 orderitems.save

 puts "order_item seed n°#{i}"
 #sleep(rand(5..10))
end

################# Category ##########################

(1..10).each do |i|
  category = Category.new(
 name: Faker::Book.title,
 )

 category.save

 puts "category seed n°#{i}"
end


################# Category items ##########################

(0..15).each do |i|
  category_items = CategoryItem.new(
 category_id: rand(1..10),
 item_id: i,
 )

 category_items.save

 puts "category_item seed n°#{i}"
end


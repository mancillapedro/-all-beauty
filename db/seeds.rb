# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

# ----- inicio creacion supliers -----

supliers = JSON.parse(File.read('db/json_seed/supliers.json'))

supliers.each do |suplier_attr|
    suplier = Suplier.new(suplier_attr)
    if suplier.save!
      puts "suplier #{suplier.name} creado"
      user_suplier = UserSuplier.new(email: suplier.email, password: '123qaz')
      if user_suplier.save!
        SuplierUserSuplier.create(suplier: suplier, user_suplier: user_suplier)
        puts "user_suplier #{user_suplier.email} creado"
      end
    end
end

supliers = Suplier.all

# ----- fin creacion suppliers -----

# ----- inicio creacion categories y products -----

products = JSON.parse(File.read('db/json_seed/products.json'))

products.each do |cat|
  # --- creacion categories ---
  category =  Category.new(name: cat["category"])
  category.save!
  puts "categoria #{category.name} creada"
  cat["products"].each do |product|
    # --- creacion products ---
    product["stock"] = rand(0..30)
    new_product = Product.new(product)
    new_product.category = category
    new_product.suplier = supliers.sample
    new_product.save!
    puts "producto #{new_product.name} creado"
  end
end

# ----- fin creacion productos y categorias -----

puts "fin"


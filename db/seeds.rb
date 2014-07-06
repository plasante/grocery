# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Retailer.delete_all
maxi   = Retailer.create(name: 'Maxi')
iga    = Retailer.create(name: 'IGA')
metro  = Retailer.create(name: 'Metro')
superc = Retailer.create(name: 'SuperC')
tiger  = Retailer.create(name: 'Tiger')

Category.delete_all
Category.create(name: 'baby products')
Category.create(name: 'bakery')
Category.create(name: 'baking ingredients')
Category.create(name: 'beer & wine')
Category.create(name: 'beverages')
Category.create(name: 'coffee tea & cocoa')
Category.create(name: 'dairy products')
Category.create(name: 'delicatessen')
Category.create(name: 'fish & seafood')
Category.create(name: 'frozen foods')
Category.create(name: 'health & beauty')
Category.create(name: 'household products')
Category.create(name: 'juice')
Category.create(name: 'meat')
Category.create(name: 'non-perishable foods')
Category.create(name: 'organic and natural foods')
Category.create(name: 'Pet products')
Category.create(name: 'Poultry')
Category.create(name: 'Prepared foods')
Category.create(name: 'Produce')

category_bakery         = Category.find_by(name: 'bakery')
category_dairy_products = Category.find_by(name: 'dairy products')
category_beverages      = Category.find_by(name: 'beverages')

SubCategory.delete_all
category_bakery.sub_categories.build(name: 'bread').save
category_dairy_products.sub_categories.build(name: 'milk').save
category_beverages.sub_categories.build(name: 'soda').save

SubSubCategory.delete_all
category_bakery_bread = SubCategory.find_by(name: 'bread')
category_bakery_bread.sub_sub_categories.build(name: 'sliced').save

category_dairy_products_milk = SubCategory.find_by(name: 'milk')
category_dairy_products_milk.sub_sub_categories.build(name: 'reduced fat').save

category_beverages_soda = SubCategory.find_by(name: 'soda')
category_beverages_soda.sub_sub_categories.build(name: 'cola').save

Brand.delete_all
brand_bakery_bread = Brand.create(name: 'villagio')
brand_dairy_products_milk = Brand.create(name: 'lactantia')
brand_beverages_soda = Brand.create(name: 'pepsi')

Product.delete_all
bread_category = SubSubCategory.find_by(name: 'sliced')
milk_category  = SubSubCategory.find_by(name: 'reduced fat')
soda_category  = SubSubCategory.find_by(name: 'cola')

bread_product = Product.create(brand: brand_bakery_bread,        
                     categorizable: bread_category, 
                     description: 'Villagio sliced bread')
milk_product  = Product.create(brand: brand_dairy_products_milk, 
                     categorizable: milk_category,  
                     description: 'Lactantia 2% milk')
soda_product  = Product.create(brand: brand_beverages_soda,      
                     categorizable: soda_category,  
                     description: 'Pepsi cola x 24')

RetailersProduct.delete_all          

bread_product.retailers_products.build(retailer: maxi, price: 4.89).save
milk_product.retailers_products.build(retailer:  maxi, price: 5.79).save
soda_product.retailers_products.build(retailer:  maxi, price: 6.99).save

bread_product.retailers_products.build(retailer: iga,  price: 4.79).save
milk_product.retailers_products.build(retailer:  iga,  price: 5.69).save
soda_product.retailers_products.build(retailer:  iga,  price: 6.89).save

bread_product.retailers_products.build(retailer: metro,  price: 4.69).save
milk_product.retailers_products.build(retailer:  metro,  price: 5.59).save
soda_product.retailers_products.build(retailer:  metro,  price: 6.79).save

bread_product.retailers_products.build(retailer: superc,  price: 4.59).save
milk_product.retailers_products.build(retailer:  superc,  price: 5.49).save
soda_product.retailers_products.build(retailer:  superc,  price: 6.79).save

bread_product.retailers_products.build(retailer: tiger,  price: 4.49).save
milk_product.retailers_products.build(retailer:  tiger,  price: 5.39).save
soda_product.retailers_products.build(retailer:  tiger,  price: 6.69).save
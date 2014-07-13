# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
user1 = User.create(name: 'Default User', email: 'default_user@email.com', password: '123456', password_confirmation: '123456')
user2 = User.create(name: 'Pierre Lasante', email: 'plasante@email.com', password: '123456', password_confirmation: '123456')
Retailer.delete_all
maxi   = Retailer.create(name: 'Maxi', no: '1100', street: 'Montee Masson', city: 'Mascouche', state: 'Quebec', country: 'Canada', zip: 'J7K 2L8')
iga    = Retailer.create(name: 'IGA', no: '65', street: 'Montee Masson', city: 'Mascouche', state: 'Quebec', country: 'Canada', zip: 'J7K 3B4')
metro  = Retailer.create(name: 'Metro', no: '875', street: 'Montee Masson', city: 'Mascouche', state: 'Quebec', country: 'Canada', zip: 'J7K 3T3')
superc = Retailer.create(name: 'SuperC', no: '1395', street: 'boul Moody', city: 'Terrebonne', state: 'Quebec', country: 'Canada', zip: 'J6X 4C8')
tiger  = Retailer.create(name: 'Tiger', no: '415', street: 'Montee Masson', city: 'Mascouche', state: 'Quebec', country: 'Canada', zip: 'J7K 2L5')

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
category_coffees        = Category.find_by(name: 'coffee tea & cocoa')

SubCategory.delete_all
category_bakery.sub_categories.build(name: 'bread').save
category_dairy_products.sub_categories.build(name: 'milk').save
category_dairy_products.sub_categories.build(name: 'margarine').save
category_beverages.sub_categories.build(name: 'soda').save
category_coffees.sub_categories.build(name: 'coffee').save

SubSubCategory.delete_all
category_bakery_bread = SubCategory.find_by(name: 'bread')
category_bakery_bread.sub_sub_categories.build(name: 'sliced').save

category_dairy_products_milk = SubCategory.find_by(name: 'milk')
category_dairy_products_milk.sub_sub_categories.build(name: 'reduced fat').save

category_beverages_soda = SubCategory.find_by(name: 'soda')
category_beverages_soda.sub_sub_categories.build(name: 'cola').save

Brand.delete_all
brand_bakery_bread = Brand.create(name:             'weston')
brand_dairy_products_milk = Brand.create(name:      'lactantia')
brand_dairy_products_margarine = Brand.create(name: 'fleishman')
brand_beverages_soda = Brand.create(name:           'pepsi')
brand_coffee = Brand.create(name:                   'tassimo')

Product.delete_all
bread_category     = SubSubCategory.find_by(name: 'sliced')
milk_category      = SubSubCategory.find_by(name: 'reduced fat')
soda_category      = SubSubCategory.find_by(name: 'cola')
margarine_category = SubCategory.find_by(name:    'margarine')
coffee_category    = SubCategory.find_by(name:    'coffee')

bread_product      = Product.create(brand: brand_bakery_bread,        
                     categorizable: bread_category, 
                     description: 'Weston white sliced bread 570g')
milk_product       = Product.create(brand: brand_dairy_products_milk, 
                     categorizable: milk_category,  
                     description: 'Lactantia milk 2% 2L')
margarine_product  = Product.create(brand: brand_dairy_products_margarine, 
                     categorizable: margarine_category,  
                     description: 'Fleishman margarine 907g')
soda_product       = Product.create(brand: brand_beverages_soda,      
                     categorizable: soda_category,  
                     description: 'Pepsi cola 24 x 355ml')
coffee_product     = Product.create(brand: brand_coffee,
                     categorizable: coffee_category,  
                     description: 'Tassimo Nabob breakfast blend 123g')

RetailersProduct.delete_all          

bread_product.retailers_products.build(retailer:     maxi,   price: 4.39).save
milk_product.retailers_products.build(retailer:      maxi,   price: 5.79).save
soda_product.retailers_products.build(retailer:      maxi,   price: 6.99).save
margarine_product.retailers_products.build(retailer: maxi,   price: 7.49).save
coffee_product.retailers_products.build(retailer:    maxi,   price: 9.49).save

bread_product.retailers_products.build(retailer:     iga,    price: 4.29).save
milk_product.retailers_products.build(retailer:      iga,    price: 5.69).save
soda_product.retailers_products.build(retailer:      iga,    price: 6.89).save
margarine_product.retailers_products.build(retailer: iga,    price: 7.39).save
coffee_product.retailers_products.build(retailer:    iga,    price: 9.39).save

bread_product.retailers_products.build(retailer:     metro,  price: 4.19).save
milk_product.retailers_products.build(retailer:      metro,  price: 5.59).save
soda_product.retailers_products.build(retailer:      metro,  price: 6.79).save
margarine_product.retailers_products.build(retailer: metro,  price: 7.29).save
coffee_product.retailers_products.build(retailer:    metro,  price: 9.29).save

bread_product.retailers_products.build(retailer:     superc, price: 999999.01).save
milk_product.retailers_products.build(retailer:      superc, price: 999999.01).save
soda_product.retailers_products.build(retailer:      superc, price: 999999.01).save
margarine_product.retailers_products.build(retailer: superc, price: 999999.01).save
coffee_product.retailers_products.build(retailer:    superc, price: 999999.01).save

bread_product.retailers_products.build(retailer:     tiger,  price: 999999.01).save
milk_product.retailers_products.build(retailer:      tiger,  price: 999999.01).save
soda_product.retailers_products.build(retailer:      tiger,  price: 999999.01).save
margarine_product.retailers_products.build(retailer: tiger,  price: 999999.01).save
coffee_product.retailers_products.build(retailer:    tiger,  price: 999999.01).save

GroceryList.delete_all
grocery_list1 = GroceryList.create(user_id: user1.id)
grocery_list2 = GroceryList.create(user_id: user2.id)

GroceryListItem.delete_all
GroceryListItem.create(grocery_list_id: grocery_list1.id, product_id: bread_product.id)
GroceryListItem.create(grocery_list_id: grocery_list1.id, product_id: milk_product.id)
GroceryListItem.create(grocery_list_id: grocery_list1.id, product_id: soda_product.id)
GroceryListItem.create(grocery_list_id: grocery_list1.id, product_id: margarine_product.id)
GroceryListItem.create(grocery_list_id: grocery_list1.id, product_id: coffee_product.id)

GroceryListItem.create(grocery_list_id: grocery_list2.id, product_id: bread_product.id)
GroceryListItem.create(grocery_list_id: grocery_list2.id, product_id: milk_product.id)
GroceryListItem.create(grocery_list_id: grocery_list2.id, product_id: soda_product.id)
GroceryListItem.create(grocery_list_id: grocery_list1.id, product_id: margarine_product.id)
GroceryListItem.create(grocery_list_id: grocery_list1.id, product_id: coffee_product.id)
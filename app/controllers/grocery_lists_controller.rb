class GroceryListsController < ApplicationController
  def new
  end

  def create
  end

  def show
    @grocery_list = "TODO build logic to show list"
  end

  def destroy
  end
  
  def savemoney
    build_save_money_list
  end
  
  private
    
    def build_save_money_list
      # Si le user n'est pas logger alors default_user sera utiliser
      user = nil
      if !current_user
        user = User.find_by(email: 'default_user@email.com')
      else
        user = User.find_by(email: current_user.email)
      end
      
      if user.similar_allowed
        process_similar(user)
      else
        process_not_similar(user)
      end
    end
  
    def process_similar(user)
      grocery_list = user.grocery_list
      product_list = grocery_list.products
      # Obtient un array des categories des produits.
      categories = []
      product_list.each do |product|
        categories << product.categorizable
      end
      # Pour chaque categories par retailer on trouver les produits similaires les moins chers
      storeCol = []
      Retailer.all.each do |retailer|
        rpCol = []
        categories.each do |category|
          # Trouve le id du produit similaire le moins cher
          product_csv = category.products.pluck(:id).join(",")
          rp = RetailersProduct.select('retailer_id store, min(price) as total')
                                .where("product_id in (#{product_csv}) AND retailer_id = #{retailer.id}")
                                .group('retailer_id')
          rpCol << rp
        end
        sum = 0
        retailer_id = 0
        rpCol.each do |retailerProduct|
          sum += retailerProduct.first.total
          retailer_id = retailerProduct.first.store
        end
        storeCol << [retailer_id, sum]
      end
      storeCol = storeCol.sort_by{ |item| item[1]}

      @store_name_list = []
      @product_name_list = []
      
      @best_price_1 = storeCol[0][1].to_s
      @best_store_1 = Retailer.find_by(id: storeCol[0][0])
      @store_name_list << @best_store_1.name
      #product_csv = category.products.pluck(:id).join(",")
      product_csv = "139,140,143,142,144"
      @product_name_list = Product.select('*').where("id IN (#{product_csv})").pluck('description')
      @best_price_list_1 = RetailersProduct.select('retailer_id, product_id, price')
                                           .where("product_id IN (#{product_csv}) AND retailer_id = #{storeCol[0][0]}")
      puts @best_price_list_1.inspect                          
      render 'savemoneysimilar'
    end
  
    def process_not_similar(user)
      grocery_list = user.grocery_list
      
      product_list = grocery_list.products
      
      # produit un string "64,65,66"
      product_csv = product_list.pluck(:id).join(",")
  
      # Produit un array de 1 element que l'on peut acceder rp.first.total.to_s
      rp = RetailersProduct.select('retailer_id store, sum(price) as total')
                           .where("product_id in (#{product_csv})")
                           .group('retailer_id')
                           .order('total ASC')
                           .limit(3)
      
      @store_name_list = []
      @product_name_list = []
      
      @best_price_1 = rp.first.total.to_s
      @best_store_1 = Retailer.find_by(id: rp.first.store)
      @store_name_list << @best_store_1.name
      @product_name_list = Product.select('*').where("id IN (#{product_csv})").pluck('description')
      @best_price_list_1 = RetailersProduct.select('retailer_id, product_id, price')
                                           .where("product_id IN (#{product_csv}) AND retailer_id = #{rp.first.store}")
      
      @best_price_2 = rp.second.total.to_s
      @best_store_2 = Retailer.find_by(id: rp.second.store)
      @store_name_list << @best_store_2.name
      @best_price_list_2 = RetailersProduct.select('retailer_id, product_id, price')
                                           .where("product_id IN (#{product_csv}) AND retailer_id = #{rp.second.store}")
      
      @best_price_3 = rp.third.total.to_s
      @best_store_3 = Retailer.find_by(id: rp.third.store)
      @store_name_list << @best_store_3.name
      @best_price_list_3 = RetailersProduct.select('retailer_id, product_id, price')
                                           .where("product_id IN (#{product_csv}) AND retailer_id = #{rp.third.store}")
    end
end

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
      
      grocery_list = user.grocery_list
      
      product_list = grocery_list.products
      
      # produit un string "64,65,66"
      product_csv = product_list.pluck(:id).join(",")

      # Produit un array de 1 element que l'on peut acceder rp.first.total.to_s
      rp = RetailersProduct.select('retailer_id store, sum(price) as total')
                           .where("product_id in (#{product_csv})")
                           .group('retailer_id')
                           .order('total ASC')
                           .limit(1)
      @best_price = rp.first.total.to_s
      @best_store = Retailer.find_by(id: rp.first.store).name
      @best_price_list = RetailersProduct.select('retailer_id, product_id, price')
                                         .where("product_id IN (#{product_csv}) AND retailer_id = #{rp.first.store}")             
    end
end

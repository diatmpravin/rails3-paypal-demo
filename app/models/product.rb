class Product < ActiveRecord::Base
  attr_accessible :name, :price
  
  def paypal_url(return_url)
  	values = {
    	:business => 'diatm._1347268590_biz@gmail.com',
   		:cmd => '_cart',
 	    :upload => 1,
	    :return => return_url,
 	    :invoice => id
	  }
	  
  	  values.merge!({
  	   "amount_1" => 10,
 	     "item_name_1" => 'test',
 	     "item_number_1" => 1,
 	     "quantity_1" => 1
  	  })
	  
	  "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
	end
  
end

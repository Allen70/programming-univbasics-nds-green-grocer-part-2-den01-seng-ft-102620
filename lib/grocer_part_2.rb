require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  cart.each{|index|
  index.each{|key,value|
  coupons.each{|cindex|
  cindex.each{|ckey,cvalue|
    if key == ckey && value == cvalue && cindex[:num] <= index[:count]
      
      cart[cart.length] = {}
      cart[cart.length-1][:item] = index[:item] + " W/COUPON"
      cart[cart.length-1][:price] = cindex[:cost]/cindex[:num]
      cart[cart.length-1][:clearance] = index[:clearance]
      cart[cart.length-1][:count] = cindex[:num]
      index[:count] -= cindex[:num]
    end
  }
  }
  }
  }
end

def apply_clearance(cart)
  cart.each{|index|
  if index[:clearance] == true
  index[:price] = (index[:price]*0.8).round(2)
  end
  }
end

def checkout(cart, coupons)
   current_bill = 0
   count =0
  binding.pry
  consolidate_cart(cart)
  cart.each{|index|
  array= []
  if cart[count][:item] == cart[count+1][:item]
      if cart[count][:count] && cart[count+1][:count]
      cart[count][:count] + cart[count+1][:count]
      cart[count+1].slice!
      count +=1
    end
  end
  }
  apply_coupons(cart,coupons)
 
  apply_clearance(cart)
  
  cart.each{|index|

  current_bill += (index[:price]*index[:count])
 if current_bill >= 100
   current_bill * 0.9
 end

 }
 current_bill

end

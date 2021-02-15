require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  counter = 0
  while counter < coupons.length
    cart_item = find_item_by_name_in_collection(coupons[counter][:item], cart)
    couponed_item_name = "#{coupons[counter][:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_name, cart)
    if cart_item && cart_item[:count] >= coupons[counter][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count]+= coupons[counter][:num]
        cart_item[:count]-=coupons[counter][:num]
      else
        cart_item_with_coupon={
          :item => couponed_item_name,
          :price => coupons[counter][:cost]/coupons[counter][:num],
          :count => coupons[counter][:num],
          :clearance => cart_item[:clearance]
        }
        cart << cart_item_with_coupon
        cart_item[:count]-=coupons[counter][:num]
      end
    end
    counter+=1
  end
  cart
end

def apply_clearance(cart)
  counter =0
  clearance_cart = []

  while counter < cart.length
    if cart[counter][:clearance] == true
      clearanced_item = {
        :item => cart[counter][:item],
        :price => cart[counter][:price] * 0.8,
        :clearance => cart[counter][:clearance],
        :count => cart[counter][:count]
      }
      clearance_cart << clearanced_item
    else
      clearance_cart << cart[counter]
    end
    counter +=1
  end
  clearance_cart
end

def checkout(cart, coupons)
  consolidated_cart= consolidate_cart(cart)
  couponed_cart = apply_coupons(consolidate_cart)
  clearanced_cart = apply_clearance(couponed_cart)
  counter = 0
  grand_total = []

  while counter < clearanced_cart
    binding.pry
    counter +=1
  end

end

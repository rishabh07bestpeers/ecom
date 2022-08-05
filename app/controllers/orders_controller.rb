class OrdersController < ApplicationController
    load_and_authorize_resource
    def index
        @user = current_user
        @orders = @user.orders 
    end

    def show
        @order = Order.find(params[:id])
        if current_user.orders.ids.include? @order.id
            @order_details = @order.order_details
        else
            redirect_to orders_path
        end
    end

    def create
        @user = current_user
        @carts = @user.carts
        # @total = 0
        # @carts.each do |cart|
        #     @product = Product.find(cart.product_id)
        #     @total = @total  + (@product.price * cart.quantity)
        # end
        
        @order =  @user.orders.new(total_params)

        if  @order.save
            @carts.each do |cart|
                @product = Product.find(cart.product_id)
                @product.stock = @product.stock - cart.quantity
                @product.save


                @order_details = @order.order_details.new(product_id: cart.product_id, quantity: cart.quantity, subtotal: (@product.price * cart.quantity))
                @order_details.save
            end
            @user.carts.destroy_all


            
            redirect_to order_path(@order)
        end
      
    end

    private
    def total_params
      params.permit(:total)
    end
end

class CartsController < ApplicationController
    authorize_resource
    def index
        @user = current_user
        @carts =  @user.carts
        
    end

    def create
        @user = current_user
        @cart =  @user.carts.new(product_params)
        if  @cart.save
           
            # @product = Product.find(@cart.product_id)
            # @product.stock = @product.stock - @cart.quantity
        
            # @product.save

            redirect_to buyers_path
      
        end
        
    end

    def update
        @user = current_user
        @cart = Cart.find(params[:id])
        # @cart_old_quantity = @cart.quantity
       
        if @cart.update(cart_params)
            # @product = Product.find(@cart.product_id)
            # if(@cart_old_quantity > @cart.quantity)
            #     @product.stock = @product.stock + (@cart_old_quantity - @cart.quantity)

            # else
            #     @product.stock = @product.stock - (@cart.quantity - @cart_old_quantity)
            # end
            # @product.save

            redirect_to  carts_path
       
        end
    end

    def destroy
        @cart = Cart.find(params[:id])
        # @product = Product.find(@cart.product_id)
        
        # @product.stock = @product.stock + @cart.quantity
        # @product.save
        @cart.destroy
    
        redirect_to buyers_path
      end

    private
        def product_params
            params.require(:product).permit(:product_id, :quantity)
        end
        def cart_params
            params.require(:cart).permit(:product_id, :quantity)
        end
end

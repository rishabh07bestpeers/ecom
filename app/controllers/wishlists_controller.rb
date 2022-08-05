class WishlistsController < ApplicationController
  load_and_authorize_resource
    def index
        @user = current_user
        @wishlists = @user.wishlists
    end

    def create
        @product = Product.find(params[:product_id])
        @user = current_user
        @wishlist = @user.wishlists.new(product_id:@product.id)
        if  @wishlist.save
            redirect_to buyers_path
        end
    end


  def destroy
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy

    redirect_to buyers_path
  end

end

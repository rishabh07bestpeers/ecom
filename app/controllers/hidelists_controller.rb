class HidelistsController < ApplicationController
  load_and_authorize_resource
    def index
        @user = current_user
        @hidelists = @user.hidelists
    end

    def create
        @product = Product.find(params[:product_id])
        @user = current_user
        @hidelist = @user.hidelists.new(product_id:@product.id)
        if  @hidelist.save
            redirect_to sellers_path
        end
    end


  def destroy
    @hidelist = Hidelist.find(params[:id])
    @hidelist.destroy

    redirect_to sellers_path
  end

end

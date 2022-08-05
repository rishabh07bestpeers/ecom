class BuyersController < ApplicationController
    load_and_authorize_resource :class => "Cart"
    def index
        @user = current_user
        @products = Product.all
    end

    def search
        @user = current_user
        @products = Product.where("name Like :search", search: "%#{params[:query]}%")
    end
end

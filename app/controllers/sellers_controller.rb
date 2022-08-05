class SellersController < ApplicationController
   load_and_authorize_resource :class => "Product"
    def index
        @user = current_user

    end

    def new
        @user = current_user
        @product = Product.new
    end


    def show
        @user = current_user
        @product = Product.find(params[:id])
       
        if current_user.products.ids.include? @product.id
          @orders = Order.all
        else
            redirect_to sellers_path
        end

    end
    
    def create
        @user = current_user
        @product =  @user.products.new(product_params)

        if  @product.save
            redirect_to sellers_path
        else
        render :new
        end

    end

    def edit
        @user = current_user
        @product = Product.find(params[:id])
    end


  def update
    @user = current_user
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to sellers_path
    else
      render :edit
    end
  end


  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to sellers_path
  end

    private
    def product_params
      params.require(:product).permit(:name, :price, :stock)
    end
end

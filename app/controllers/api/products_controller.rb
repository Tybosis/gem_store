module API
  class ProductsController < ApplicationController
    def index
      products = Product.all
      if price = params[:price]
        products = Product.where(price: price)
      end
      render json: products, root: false, status: 200
    end

    def show
      product = Product.find(params[:id])
      render json: product, root: false, status: 200
    end

    def create
      product = Product.new(product_params)
      if product.save
        render json: product, root: false, status: 201, location: api_product_url(product[:id])
      else
        render json: product.errors, status: 422
      end
    end

    def destroy
      product = Product.find(params[:id])
      product.destroy!
      render nothing: true, status: 204
    end

    def update
      product = Product.find(params[:id])
      if product.update(product_params)
        render json: product, status: 200
      else
        render json: product.errors, status: 422
      end
    end

    private

    def product_params
      params.require(:product).permit(:name, :description, :shine, :price,
                                      :rarity, :color, :faces, :images, :review)
    end
  end
end

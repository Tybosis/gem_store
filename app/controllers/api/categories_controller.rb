module API
  class CategoriesController < ApplicationController
    def index
      if category = params[:category]
        products = Product.where(category: category)
        respond_to do |format|
          format.json { render json: products, root: false, status: 200 }
        end
      end
    end
  end
end

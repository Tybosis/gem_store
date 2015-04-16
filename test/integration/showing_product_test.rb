require 'test_helper'

class ShowingProductTest < ActionDispatch::IntegrationTest
  test 'show one specific product' do
    @product = Product.create!(name: 'Cubic Zirconia')
    get "/api/products/#{@product.id}"
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal 'Cubic Zirconia', json(response.body)[:name]
  end
end

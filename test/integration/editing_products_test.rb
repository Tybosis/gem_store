require 'test_helper'

class EditingProductsTest < ActionDispatch::IntegrationTest
  test 'editing an existing product' do
    @product = Product.create!(name: 'new product', price: 3_200)
    patch "/api/products/#{@product.id}", { product: { name: 'hello world', price: 4_200 } },
          { 'Accept' => 'application/json',
            'Content_type' => 'application/json' }
    assert_equal 200, response.status
    assert_equal 'hello world', @product.reload.name
    assert_equal 4_200, @product.reload.price
  end

  test 'editing a product with no name should return an error' do
    @product = Product.create!(name: 'happy', price: 5_000)
    patch "/api/products/#{@product.id}", { product: {name: ''} },
          { 'Accept' => 'application/json',
            'Content_type' => 'application/json' }
    assert_equal 422, response.status
  end
end

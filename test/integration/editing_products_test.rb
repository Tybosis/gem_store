require 'test_helper'

class EditingProductsTest < ActionDispatch::IntegrationTest
  test 'editing an existing product' do
    @product = Product.create!(name: 'new product')
    patch "/products/#{@product.id}", { product: { name: 'hello world' } },
          { 'Accept' => 'application/json',
            'Content_type' => 'application/json' }
    assert_equal 200, response.status
    assert_equal 'hello world', @product.reload.name
  end

  test 'editing a product with no name should return an error' do
    @product = Product.create!(name: 'happy')
    patch "/products/#{@product.id}", { product: {name: ''} },
          { 'Accept' => 'application/json',
            'Content_type' => 'application/json' }
    assert_equal 422, response.status
  end
end

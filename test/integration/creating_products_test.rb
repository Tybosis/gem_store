require 'test_helper'

class CreatingProductsTest < ActionDispatch::IntegrationTest
  test 'creating a new product' do
    post '/api/products',
         { product: { name: 'new gem', description: 'just a gem', price: 2_000,
                      color: '#FFF666', shine: 3 } }.to_json,
         { 'Accept' => 'application/json',
           'Content-Type' => 'application/json' }

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type
    product = json(response.body)
    assert_equal api_product_url(product[:id]), response.location
    assert_equal 'new gem', product[:name]
  end

  test 'does not create product without a name that is at least five characters' do
    post '/api/products',
         { product:
           {
             name: 'yo',
             price: 1000
           }
         }.to_json,
         { 'Accept' => 'application/json',
           'Content-Type' => 'application/json' }

    assert_equal 422, response.status
  end

  test 'does not create a product without a price' do
    post '/api/products',
         { product:
           {
             name: 'amethyst',
             price: nil
           }
         }.to_json,
         { 'Accept' => 'application/json',
           'Content-Type' => 'application/json' }

    assert_equal 422, response.status
  end
end

require 'test_helper'

class ListingProductsTest < ActionDispatch::IntegrationTest
  setup do
    descrip = 'A ruby is a pink to blood-red colored gemstone, a variety of the mineral corundum'
    Product.create!(name: 'Ruby', description: descrip,
                    shine: 10, color: '#FF0000', price: 5_000)
    Product.create!(name: 'Sapphire',
                    description: 'typically blue gemstone variety of the mineral corundum, an aluminium oxide',
                    shine: 8, color: '#3C75C8', price: 1_000)
  end

  test 'listing products' do
    get '/api/products'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal Product.count, json(response.body).size
  end

  test 'lists most expensive products only' do
    get '/api/products?price=5000'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal 1, json(response.body).size
  end
end

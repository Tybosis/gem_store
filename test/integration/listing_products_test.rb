require 'test_helper'

class ListingProductsTest < ActionDispatch::IntegrationTest
  setup do
    descrip = 'A ruby is a pink to blood-red colored gemstone, a variety of the mineral corundum'
    Product.create!(name: 'Ruby', description: descrip, shine: 10, color: '#FF0000')
  end

  test 'listing products' do
    get '/products'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal Product.count, JSON.parse(response.body).size
  end
end

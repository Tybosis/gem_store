require 'test_helper'

class ListingProductsTest < ActionDispatch::IntegrationTest
  get '/products'

  assert_equal 200, response.status
  assert_equal Mime::JSON, response.content_type
end

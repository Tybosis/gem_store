require 'test_helper'

class DeletingProductsTest < ActionDispatch::IntegrationTest
  test 'deleting a product' do
    obsidian = Product.create!(name: 'Obsidian', price: 500)
    delete "/api/products/#{obsidian.id}"
    assert_equal 204, response.status
    assert_equal 0, Product.count
  end
end

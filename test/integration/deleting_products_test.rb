require 'test_helper'

class DeletingProductsTest < ActionDispatch::IntegrationTest
  test 'deleting a product' do
    obsidian = Product.create!(name: 'Obsidian', price: 500)
    delete "/products/#{obsidian.id}"
    assert_equal 204, response.status
  end
end

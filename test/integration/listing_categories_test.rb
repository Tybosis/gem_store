require 'test_helper'

class ListingCategoriesTest < ActionDispatch::IntegrationTest
  setup do
    Product.create!(name: 'Gem', description: 'Oooh shiny!', category: 'rare')
    Product.create!(name: 'Obsidian', description: 'It\'s like glass yo!',
                    category: 'common')
  end

  test 'lists categories' do
    get '/api/categories?category=common', {}, 'Accept' => 'application/json'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal 'Obsidian', json(response.body).first[:name]
    assert_equal 1, json(response.body).size
  end
end

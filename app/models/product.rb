class Product < ActiveRecord::Base
  validates :name, length: { minimum: 5 }
  validates :price, presence: true
end

class Product
  include Mongoid::Document

  field :name
  field :price

  belongs_to :product_type
  has_and_belongs_to_many :menus
  has_and_belongs_to_many :orders
end
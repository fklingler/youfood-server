class ProductType
  include Mongoid::Document

  field :name

  has_many :products
end
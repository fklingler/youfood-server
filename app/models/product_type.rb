class ProductType
  include Mongoid::Document
  include Mongoid::Slug

  field :name

  has_many :products

  slug :name
  validates_presence_of :name
end
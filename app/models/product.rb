class Product
  include Mongoid::Document
  include Mongoid::Slug

  field :name
  field :price

  belongs_to :product_type
  has_and_belongs_to_many :menus
  has_and_belongs_to_many :orders

  slug :name
  validates_presence_of :name, :price
end
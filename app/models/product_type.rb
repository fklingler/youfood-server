class ProductType
  include Mongoid::Document
  include Mongoid::Slug

  field :name

  has_many :products

  slug :name
  validates :name, presence: true, uniqueness: true
end
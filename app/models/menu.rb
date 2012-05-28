class Menu
  include Mongoid::Document
  include Mongoid::Slug

  field :name

  has_and_belongs_to_many :products
  has_many :restaurants

  slug :name
end
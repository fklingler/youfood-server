class Restaurant
  include Mongoid::Document
  include Mongoid::Slug

  field :name
  field :address

  has_many :zones
  belongs_to :menu

  slug :name
end
class Restaurant
  include Mongoid::Document

  field :name
  field :address

  has_many :zones
  belongs_to :menu
end
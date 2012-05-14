class Order
  include Mongoid::Document

  field :deliverd, type: Boolean
  field :paid, type: Boolean

  belongs_to :seat
  has_and_belongs_to_many :products
  belongs_to :orderer, polymorphic: true
end
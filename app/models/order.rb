class Order
  include Mongoid::Document

  field :delivered, type: Boolean
  field :paid, type: Boolean

  belongs_to :table
  has_and_belongs_to_many :products
  belongs_to :orderer, polymorphic: true
end
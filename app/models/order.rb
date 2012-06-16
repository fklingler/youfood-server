class Order
  include Mongoid::Document

  field :delivered, type: Boolean
  field :paid, type: Boolean

  belongs_to :table
  belongs_to :device

  embeds_many :order_items
end
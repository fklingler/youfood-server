class OrderItem
  include Mongoid::Document

  field :quantity, type: Integer

  embedded_in :order
  belongs_to :product
end
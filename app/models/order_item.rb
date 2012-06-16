class OrderItem
  include Mongoid::Document

  field :quantity, type: Integer

  embedded_in :order
  belongs_to :product

  acts_as_api
  api_accessible :public do |t|
    t.add :quantity
    t.add :product
  end
end
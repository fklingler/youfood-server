class Waiter
  include Mongoid::Document

  field :first_name
  field :last_name

  belongs_to :zone
  has_many :orders, as: :orderer
end
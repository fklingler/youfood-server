class Device
  include Mongoid::Document

  belongs_to :table
  has_many :orders, as: :orderer
end
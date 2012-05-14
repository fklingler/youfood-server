class Zone
  include Mongoid::Document

  belongs_to :restaurant
  has_many :tables
  belongs_to :waiter
end
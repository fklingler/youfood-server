class Seat
  include Mongoid::Document

  field :number, type: Integer

  belongs_to :table
  has_many :orders
end
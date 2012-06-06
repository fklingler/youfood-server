class Table
  include Mongoid::Document
  include Mongoid::Slug

  field :number, type: Integer

  belongs_to :restaurant
  belongs_to :zone
  belongs_to :device
  has_many :orders

  slug :number, :scope => :restaurant
  validates_presence_of :number
end
class Table
  include Mongoid::Document
  include Mongoid::Slug

  field :number, type: Integer

  belongs_to :restaurant
  belongs_to :zone
  has_one :device, :as => :owner
  has_many :orders

  slug :number, :scope => :restaurant
  validates_presence_of :number
end
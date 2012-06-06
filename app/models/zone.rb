class Zone
  include Mongoid::Document
  include Mongoid::Slug

  field :name

  belongs_to :restaurant
  has_many :tables
  belongs_to :waiter

  slug :name, :scope => :restaurant
  validates_presence_of :name
end
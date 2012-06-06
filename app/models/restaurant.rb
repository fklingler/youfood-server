class Restaurant
  include Mongoid::Document
  include Mongoid::Slug

  field :name
  field :address
  field :menu_begin_date, type: Date
  field :menu_end_date, type: Date

  has_many :zones
  has_many :tables
  belongs_to :menu

  slug :name
  validates_presence_of :name
end
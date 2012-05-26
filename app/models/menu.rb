class Menu
  include Mongoid::Document
  include Mongoid::Slug

  field :name
  field :begin_date, type: Date
  field :end_date, type: Date

  has_and_belongs_to_many :products
  has_many :restaurants

  slug :name
end
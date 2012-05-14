class Menu
  include Mongoid::Document

  field :name
  field :begin_date, type: DateTime
  field :end_date, type: DateTime

  has_and_belongs_to_many :products
  has_many :restaurants
end
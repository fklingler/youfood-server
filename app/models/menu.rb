class Menu
  include Mongoid::Document
  include Mongoid::Slug

  field :name

  has_and_belongs_to_many :products
  has_many :restaurants

  slug :name
  validates_presence_of :name

  acts_as_api
  api_accessible :public do |t|
    t.add :name
    t.add :products
  end
end
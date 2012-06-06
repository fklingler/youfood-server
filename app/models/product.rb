class Product
  include Mongoid::Document
  include Mongoid::Slug

  field :name
  field :price

  belongs_to :product_type
  has_and_belongs_to_many :menus
  has_and_belongs_to_many :orders

  slug :name
  validates_presence_of :name, :price

  acts_as_api
  api_accessible :public do |t|
    t.add :name
    t.add :price
    t.add :product_type_name, :as => :product_type
  end

  def product_type_name
    product_type.name
  end
end
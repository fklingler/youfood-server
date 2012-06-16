class Product
  include Mongoid::Document
  include Mongoid::Slug

  field :name
  field :price, type: Float

  belongs_to :product_type
  has_and_belongs_to_many :menus

  slug :name
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0}

  acts_as_api
  api_accessible :public do |t|
    t.add :_id, :as => :id
    t.add :name
    t.add :price
    t.add :product_type_name, :as => :product_type
  end

  def product_type_name
    product_type.name
  end
end
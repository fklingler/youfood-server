class Table
  include Mongoid::Document
  include Mongoid::Slug

  field :number, type: Integer

  belongs_to :restaurant
  belongs_to :zone
  has_one :device, :as => :owner, :dependent => :delete
  has_many :orders

  slug :number, :scope => :restaurant
  validates_presence_of :number

  acts_as_api
  api_accessible :public do |t|
    t.add :number
  end
end
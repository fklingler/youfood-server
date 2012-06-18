class Order
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :delivered, type: Boolean, default: false
  field :paid, type: Boolean, default: false

  belongs_to :table
  belongs_to :device

  embeds_many :order_items

  acts_as_api
  api_accessible :public do |t|
    t.add :_id, :as => :id
    t.add :table_number, :as => :table
    t.add :order_items
    t.add :delivered
    t.add :paid
  end

  def table_number
    table.number
  end
end
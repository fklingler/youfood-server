class Order
  include Mongoid::Document

  field :delivered, type: Boolean, default: false
  field :paid, type: Boolean, default: false

  belongs_to :table
  belongs_to :device

  embeds_many :order_items

  acts_as_api
  api_accessible :public do |t|
    t.add :table_number, :as => :table
    t.add :order_items
  end

  def table_number
    table.number
  end
end
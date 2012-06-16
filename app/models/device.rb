class Device
  include Mongoid::Document

  devise :token_authenticatable
  before_save :ensure_authentication_token

  field :authentication_token
  field :registration_id

  belongs_to :owner, polymorphic: true

  has_many :orders
end
class AlphaSerializer < ActiveModel::Serializer
  attributes :id, :alpha_a, :alpha_b
  has_one :alpha
  has_one :beta
  has_one :gam, serializer: GammaSerializer
  has_many :deltas
  has_many :delts, serializer: DeltaSerializer
end

class BetaSerializer < ActiveModel::Serializer
  attributes :id, :beta_a, :beta_b
  has_one :al, serializer: AlphaSerializer
  has_one :bet, serializer: BetaSerializer
  has_one :gam, serializer: GammaSerializer
  has_one :beta
  has_many :ds, serializer: DeltaSerializer
  has_many :deltas
  has_one :gamma
  has_one :gammas, serializer: GammaSerializer
end

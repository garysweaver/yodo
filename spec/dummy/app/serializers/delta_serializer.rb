class DeltaSerializer < ActiveModel::Serializer
  has_many :delts, serializer: DeltaSerializer
end

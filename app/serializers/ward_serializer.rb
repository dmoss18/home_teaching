class WardSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :quorums
end

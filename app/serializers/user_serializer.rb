class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :authentication_token
  has_one :quorum_member
end

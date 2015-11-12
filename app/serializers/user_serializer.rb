class UserSerializer < ActiveModel::Serializer
  attributes :user_id

  def user_id
    object.identifier
  end
end

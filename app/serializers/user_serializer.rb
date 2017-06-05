class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name

  def email
    object.email
  end
end

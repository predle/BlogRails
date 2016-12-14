class UsersSerializer < ActiveModel::Serializer
  attributes :id, :email

  has_many :posts
  has_many :comments
end

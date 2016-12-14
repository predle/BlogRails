class CommentsSerializer < ActiveModel::Serializer
  attributes :id, :content

  belongs_to :posts
end

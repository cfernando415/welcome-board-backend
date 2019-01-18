class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :mod_id
end

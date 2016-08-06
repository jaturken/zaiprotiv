class ArgumentSerializer < ActiveModel::Serializer
  attributes :id, :subject_id, :title, :body, :rank
end

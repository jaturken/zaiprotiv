class SampleSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :question_id, :argument_id
end

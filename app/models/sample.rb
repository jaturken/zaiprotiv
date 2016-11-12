class Sample < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :sample_arguments
end

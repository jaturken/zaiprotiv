class Subject < ApplicationRecord
  has_many :arguments
  has_many :samples

  # after_save ThinkingSphinx::RealTime.callback_for(:subject)
end

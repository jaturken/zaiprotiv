class Subject < ApplicationRecord
  has_many :arguments

  # after_save ThinkingSphinx::RealTime.callback_for(:subject)
end

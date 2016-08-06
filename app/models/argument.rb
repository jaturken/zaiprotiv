class Argument < ApplicationRecord
  belongs_to :subject

  def positive?
    positive == 'true'
  end
end

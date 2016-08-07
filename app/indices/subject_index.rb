ThinkingSphinx::Index.define :subject, :with => :real_time do
  # fields
  indexes name, :sortable => true

  # attributes
  has created_at, :type => :timestamp
  has updated_at, :type => :timestamp
  set_property :min_infix_len => 3
  # set_property :morphology => 'lemmatize_ru_all, lemmatize_en_all'
end

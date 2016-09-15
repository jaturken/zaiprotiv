json.extract! subject, :id, :name, :description, :image_url, :created_at, :updated_at
json.url v1_subject_url(subject, format: :json)

json.extract! subject, :id, :name, :description, :image_url, :created_at, :updated_at
json.url subject_url(subject, format: :json)
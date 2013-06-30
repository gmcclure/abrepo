json.array!(@bibliographies) do |bibliography|
  json.extract! bibliography, :title, :user_id, :course_id
  json.url bibliography_url(bibliography, format: :json)
end

json.array!(@courses) do |course|
  json.extract! course, :title, :code, :password
  json.url course_url(course, format: :json)
end

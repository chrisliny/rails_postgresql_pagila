json.array!(@questions) do |question|
  json.extract! question, :id, :content, :survey
  json.url question_url(question, format: :json)
end

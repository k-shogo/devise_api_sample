json.array!(@notes) do |note|
  json.extract! note, :id, :user_id, :title, :body
  json.url note_url(note, format: :json)
end

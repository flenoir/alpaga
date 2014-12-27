json.array!(@formats) do |format|
  json.extract! format, :id, :name, :usage, :compression, :resolution
  json.url format_url(format, format: :json)
end

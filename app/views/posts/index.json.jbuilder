json.array!(@posts) do |post|
  json.extract! post, :id, :title, :markdown, :html, :published, :slug
  json.url post_url(post, format: :json)
end

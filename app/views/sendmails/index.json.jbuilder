json.array!(@sendmails) do |sendmail|
  json.extract! sendmail, :id, :to, :subject, :body
  json.url sendmail_url(sendmail, format: :json)
end

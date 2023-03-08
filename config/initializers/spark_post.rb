SparkPostRails.configure do |c|
  c.api_key = Rails.application.credentials.spark_post.api_key
  c.api_endpoint = "https://api.eu.sparkpost.com/api/"
  c.transactional = true
end

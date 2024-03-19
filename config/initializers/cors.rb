Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*' # Update with specific origins you want to allow, or '*' to allow all origins
      resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head],
      expose: ["Authorization"]
    end
  end
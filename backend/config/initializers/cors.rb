Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # production 環境でテスト中
    origins 'http://meetwithkids.org' || ENV['API_DOMAIN'] || 'http://localhost:3000' || ''

    # development 環境で通る
    # origins ENV['API_DOMAIN'] || 'http://localhost:3000' || ''
    
    resource '*',
            headers: :any,
            expose: %w[access-token uid client token-type expiry],
            methods: %i[get post put patch delete options head]
  end
end

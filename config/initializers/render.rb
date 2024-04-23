if ENV.fetch('RENDER_DEPLOY', nil).present? && Author.count < 50
  Rails.application.load_seed
end

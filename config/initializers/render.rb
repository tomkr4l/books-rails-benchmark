if ENV.fetch('DB_SEED', nil).to_i == 1
  Rails.application.load_seed
end

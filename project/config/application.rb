require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Fuck
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    # config.assets.paths << Rails.root.join("public", "product_image")
    # config.assets.paths << Rails.root.join("public", "default")


    config.assets.paths << Rails.root.join("other","picture")
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
  end
end

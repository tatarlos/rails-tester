require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Don't generate system test files.
    config.generators.system_tests = nil
    # add fonts to rails path
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    # load lib files
    config.autoload_paths += Dir["#{Rails.root}/lib/**/"]
    config.exceptions_app = self.routes
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

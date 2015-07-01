Regexed::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  ### ENABLE THIS IS YOU WANT TO TEST AS IF LOCAL HAS PRECOMPILED ASSETS
  #config.assets.compile = false
  # config.serve_static_assets = false
  #config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
  #config.assets.digest = true

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true # DISABLE THIS IF YOU WANT TO TEST WITH PRECOMPILED ASSETS

  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.default_url_options = {
    host: "localhost:3000"
  }

  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    address: "smtp.mailgun.com",
    port: 587,
    user_name: 'postmaster@sandbox7ddcdd21092143c18523413526117f87.mailgun.org',
    password: '95944868f9c1c5adb3a1413ef1730f1a',
    :openssl_verify_mode => 'none'
  }

end

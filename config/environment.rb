# ENV['RAILS_ENV'] ||= 'production'

RAILS_GEM_VERSION = '2.2.2' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.time_zone = 'UTC'
  
  config.i18n.load_path = Dir[File.join(RAILS_ROOT, 'config', 'locales', '*.{rb,yml}')]
  config.i18n.default_locale = :cz

  config.action_controller.session = {
    :session_key => '_flash_session',
    :secret      => '036af103e6512cadd66a0f48a9d5ad66255f09bf90a0fce90c201c5a35c6082292579d21a75c63ac427e3c70d58688668f7875311ed2fbd86ff71430bc4a587c'
  }

  config.action_controller.session_store = :active_record_store

end


ActionMailer::Base.smtp_settings = {
   :tls => true,
   :address => "smtp.gmail.com",
   :port => "587",
   :domain => "YOURDOMAIN",
   :authentication => :plain,
   :user_name => "pavel.krusek",
   :password => "s4557410"
 }

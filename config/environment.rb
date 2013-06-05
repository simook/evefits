# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Evefits::Application.initialize!

if Rails.env.production?
  Rails.logger = Le.new(ENV.fetch('LOGENTRIES_TOKEN'))
end
# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Evefits::Application.initialize!

if Rails.env.development?
  Rails.logger = Le.new('LOGENTRIES_TOKEN', true)
else
  Rails.logger = Le.new('LOGENTRIES_TOKEN')
end
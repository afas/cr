# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Classicrent::Application.initialize!
require File.dirname(__FILE__) + '/../lib/stars_form_builder'

require 'nagctl'
config_file 'config/nagctl.yml'
run Sinatra::Application

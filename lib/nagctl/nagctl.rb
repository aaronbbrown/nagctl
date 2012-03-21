require 'sinatra'
require 'sinatra/config_file'
require 'yaml'
require 'json'

set :logging, true
enable :logging

config_file 'config/nagctl.yml'

configure :development do
  require 'sinatra/reloader' 
end

helpers do
  def authenticate! ( apikey )
    true
#       apikey == settings.apikey
  end

  def get_data
    request.body.rewind  # in case someone already read it
    JSON.parse request.body.read
  end

  def validate_required ( required )
    required.sort - @data.keys.sort
  end

  def cmdfile_write
    
  end

  def svcdowntime
    @data['hosts'].map do |host|
      start_time = Time.now.to_i
      duration   = @data['minutes'] * 60
      end_time   = start_time + duration

      "SCHEDULE_SVC_DOWNTIME;#{host};#{start_time};#{end_time};1;0;#{duration};nagctl api;#{@data['comment']}"
    end.join("\n")
  end
end

before do
  error 401 unless authenticate!(params[:apikey])
  if request.request_method == 'POST'
    @data = get_data
  end
end

error 400 do
  "Missing parameters" 
end

get '/foo' do
  settings.nagcmd
end

post '/svcdowntime' do
  missing_params = validate_required(%w[minutes comment hosts]) 
  unless missing_params == []
    return 400
  end
  cmdfile_write svcdowntime
end

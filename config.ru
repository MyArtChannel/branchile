ENV['PATH'] = "/usr/local/git/bin/git:#{ENV['PATH']}"

require 'rubygems'
require 'sinatra'
require 'yaml'
require 'grit'
require 'securerandom'

require './branchile.rb'
require './models/branch.rb'

credentials = YAML.load_file('users.yml')

app = Rack::Auth::Digest::MD5.new(Sinatra::Application) do |username|
  credentials["users"][username]
end

app.opaque = SecureRandom.hex

run app

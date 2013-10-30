ENV['PATH'] = "/usr/local/git/bin/git:#{ENV['PATH']}"

require 'rubygems'
require 'sinatra'
require 'grit'

require './branchile.rb'
require './models/branch.rb'

run Sinatra::Application

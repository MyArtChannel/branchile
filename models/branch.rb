require 'yaml'
require 'grit'

class Branch < Struct.new(:repo, :name, :url)
  include Grit
  
  def self.fetch
    @@config = YAML.load_file('config.yml')
    @@config['branches'].map do |key, value|
      Branch.new(Repo.new(value['path']), key, value['url'])
    end
  end

  def initialize(*args)
    super(*args)
    @commits = repo.commits(name)
  end
  
  def href
    url
  end
  
  def commits
    @commits
  end
  
  def extract(lines, regexp)
    lines.map {|line| regexp.match(line) }.compact.first[1]
  end
  
  def self.config
    @@config
  end
  
end

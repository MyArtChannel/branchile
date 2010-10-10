require 'yaml'
require 'grit'

class Branch < Struct.new(:repo, :name)
  include Grit
  
  def self.fetch
    @@config = YAML.load_file('config.yml')
    path = @@config['local']['path']
    path = @@config['local']['path']
    Dir.glob(File.join(path, "*")).map {|name|
      Branch.new(Repo.new(name), name.sub("#{path}/", ''))
      }
  end

  def initialize(*args)
    super(*args)
    @commits = repo.commits(name)
  end
  
  def href
    "http://#{name.sub('_', '-').gsub('.', '-')}.#{@@config['local']['domain']}"
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

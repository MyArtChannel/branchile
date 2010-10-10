BRANCHES = ['3.2.1-dev', 'artist_orders', 'investor_forum']

helpers do

  def partial(template, locals)
    erb "_#{template}".to_sym, {:layout => false}, locals
  end  
  
  def fogbugz(commit)
    fogbugz = extract commit.message, /\b([\d]{4,6})\b/
    if fogbugz
      yield fogbugz
    end
  end
  
  def extract(text, regexp)
    match = regexp.match(text)
    match.nil? ? nil : match[1]
  end
  
end

get '/' do
  @branches = Branch.fetch
  erb :index
end

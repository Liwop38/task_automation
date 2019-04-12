
require 'launchy'

puts "Lancement de la recherche Google" + ARGV.to_s + " MAYDAY MAYDAY !"

def check_if_user_gave_input
  abort("Il faut rentrer ta recherche google") if ARGV.empty?
end

def get_research_name
  return research_name = ARGV.join("+")
end

def launch_research(url)
  research_name = get_research_name
  url = "https://www.google.com/search?q=" + research_name
  Launchy.open(url)
end


def perform
  check_if_user_gave_input
  url = get_research_name
  launch_research(url)
end

perform
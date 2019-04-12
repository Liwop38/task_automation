p "début du programme"

def check_if_user_gave_input
  abort("Tu dois donner un nom de dossier") if ARGV.empty?
  abort("ATTENTION ! Le nom du dossier ne doit pas contenir plusieurs mots") if ARGV.length > 1
end


def create_folder(name)
  name = ARGV[0]
  rootdir = Dir.mkdir(name)
  path = Dir.pwd + "/" + name
  # Création GEMFILE dans le dossier + remplissage
  file = File.open("#{path}/Gemfile", "w")
  file.puts("source \"https://rubygems.org\"")
  file.puts("ruby '2.5.1'")
  file.puts("gem 'rspec'")
  file.puts("gem 'pry'")
  file.puts("gem 'rubocop', '~> 0.57.2'")
  file.puts("gem 'dotenv'")
  file.close
  # Création du .env + remplissage
  file2 = File.open("#{path}/.env", "w")
  file2.close
  # Création du .gitignore 
  file3 = File.open("#{path}/.gitignore", "w")
  file3.puts(".env")
  file3.close
  # Création du dossier lib
  libdir = Dir.mkdir("#{path}/lib")
  # Création du Readme.md
  file4 = File.open("#{path}/README.md", "w")
  file4.puts("Je suis un programme Ruby développé par Tristan MORIN")
  file4.close
  Dir.chdir("#{name}") do
  system "git init"
  system "rspec --init"
  end

end



def perform
  check_if_user_gave_input
  name = ARGV
  create_folder(name)
end

perform

p "fin du programme, le dossier " + ARGV.to_s + " a été crée"

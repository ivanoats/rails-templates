#gems
gem 'authlogic'
gem 'searchlogic'
gem 'rspec'
gem 'rspec-rails'
gem 'cucumber'
gem 'cucumber-rails'
gem 'formtastic'
gem 'will_paginate'
gem 'haml'
rake("gems:install")

#testing
generate :rspec


#layout
layout = ask("Nifty(n) layout or Web-app-theme(w)?")
if layout == "n" then
  gem 'nifty-generators'
  rake("gems:install")
  generate :nifty_layout
elsif layout == "w" then
  gem 'web-app-theme'
  rake("gems:install")
  generate :theme, "--engine = haml"
else
  exit
end

# version control
git :init

run "echo 'TODO add readme content' > README"
run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"
run "rm public/index.html"

file ".gitignore", <<-END
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

git :add => ".", :commit => "-m 'initial commit'"

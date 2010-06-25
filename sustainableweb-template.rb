#gems
gem 'authlogic'
gem 'searchlogic'
gem 'rspec', :lib => false
gem 'rspec-rails', :lib => false
gem 'cucumber', :lib => false
gem 'factory_girl'
gem 'webrat', :lib => false
gem 'formtastic'
gem 'will_paginate'
gem 'haml'

#bootstrap testing frameworks
generate :rspec
generate :cucumber

#bootstrap authentication
#generate :session "user_session"
#generate :rspec_model "user"
# TODO set up the model as in step 4 of github.com/binarylogic/authlogic_example
#generate :controller "user_sessions"
# TODO steps 5 6 7 and 8

#layout
layout = ask("Nifty(n) layout or Web-app-theme(w)?")
if layout == "n" then
  gem 'nifty-generators'
  generate :nifty_layout
elsif layout == "w" then
  gem 'web-app-theme', :lib => false
  generate :theme, "--engine = haml"
else
  exit
end

# version control
git :init

run "rm README"
run "echo 'TODO add readme content' > README.mdown"
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

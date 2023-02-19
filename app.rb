system 'gem install bundler --conservative'
system('bundle check') || system('bundle install') 

require './database_generate.rb' 
require './classes/task.rb' 

task = Task.new('Estudar ruby', 'estudo') 
task.save_to_db

Task.all 

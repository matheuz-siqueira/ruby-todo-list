system 'gem install bundler --conservative'
system('bundle check') || system('bundle install') 

require './database_generate.rb' 
require './classes/task.rb' 

Task.delete_by_category('estudo')
Task.all 
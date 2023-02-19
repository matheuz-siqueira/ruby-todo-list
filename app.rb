system 'gem install bundler --conservative'
system('bundle check') || system('bundle install') 

require './database_generate.rb' 
require './classes/task.rb' 



Task.find_by_id(6.to_i)


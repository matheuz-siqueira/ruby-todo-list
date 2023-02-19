system 'gem install bundler --conservative'
system('bundle check') || system('bundle install') 

require './database_generate.rb' 
require './classes/task.rb' 

Task.update(6, 'Entregar relatório', 'trabalho') 
Task.all 

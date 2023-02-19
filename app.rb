system 'gem install bundler --conservative'
system('bundle check') || system('bundle install') 

require './database_generate.rb' 
require './classes/task.rb' 

#task = Task.new('Terminar o projeto de ruby', 'trabalho')
#task.save_to_db
#Task.all
Task.find_by_category('trabalho')

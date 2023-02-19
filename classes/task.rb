require 'sqlite3'

class Task
    attr_accessor :title, :category 

    def initialize(title, category)
        @title = title 
        @category = category 
    end 

    def self.all
        db = SQLite3::Database.open "db/database.db"
        stm = db.prepare "SELECT title, category FROM Tasks"
        tasks = stm.execute    
        tasks.each do |row| 
            puts row
        end 
    end 


    def self.find_by_category(category) 
        db = SQLite3::Database.open "db/database.db"
        db.results_as_hash = true
        tasks = db.execute "SELECT title, category FROM Tasks where category='#{category}'"
     
        #puts tasks

        tasks.each do |row| 
            row.each do |key, value| 
                if key == 'category'
                    next 
                end 
                puts "#{key}: #{value}" 
            end 
        end 
        
    end 

    #def self.find_by_id(id)
    #end 


    def save_to_db 
        db = SQLite3::Database.open "db/database.db"
        db.execute "INSERT INTO Tasks VALUES ('#{@title}','#{@category}')"
        db.close 
        self 
    end 

end     
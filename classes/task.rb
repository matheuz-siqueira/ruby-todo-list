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

    def save_to_db 
        db = SQLite3::Database.open "db/database.db"
        db.execute "INSERT INTO Tasks VALUES ('#{@title}','#{@category}')"
        db.close 
        self 
    end 
end     
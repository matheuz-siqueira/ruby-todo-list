require 'sqlite3'

class Task
    attr_accessor :title, :category 

    def initialize(title, category)
        @title = title 
        @category = category 
    end 

    def self.all
        db = SQLite3::Database.open "db/database.db"
        db.results_as_hash = true 
        query = db.execute "SELECT * FROM Tasks"
        db.close 
        
        query.each do |row| 
            row.each do |key, value| 
                puts "#{key}: #{value}"
            end 
        end 
    end 


    def self.find_by_category(category) 
        db = SQLite3::Database.open "db/database.db"
        db.results_as_hash = true
        tasks = db.execute "SELECT title, category FROM Tasks where category='#{category}'"
    

        tasks.each do |row| 
            row.each do |key, value| 
                if key == 'category'
                    next 
                end 
                puts "#{key}: #{value}" 
            end 
        end 
        
    end 

    def self.find_by_id(id)
        db = SQLite3::Database.open "db/database.db"
        db.results_as_hash = true 
        task = db.execute "SELECT title, category FROM Tasks where id='#{id}'"
        
        task.each do |k,v| 
            puts "Title: #{k['title']} Category: #{k['category']}"  
        end 
    end 

    def self.update(id, title, category) 
        db = SQLite3::Database.open "db/database.db"
        db.execute "UPDATE Tasks SET title='#{title}', category='#{category}' where id='#{id}'" 
        db.close    
    end  

    def save_to_db 
        db = SQLite3::Database.open "db/database.db"
        db.execute "INSERT INTO Tasks(title, category) VALUES ('#{@title}', '#{@category}')"
        db.close 
    end 
    
    def self.delete_by_id(id) 
        db = SQLite3::Database.open "db/database.db" 
        db.execute "DELETE FROM Tasks where id='#{id}'" 
        db.close 
    end 
end     
require 'sqlite3'

begin 
    db = SQLite3::Database.open "db/database.db" 
    db.execute <<~SQL 
        CREATE TABLE IF NOT EXISTS Tasks(
            id int primary key, 
            title varchar(150),
            category varchar(100)
        );
    SQL

rescue SQLite3::Exception => e 
    puts "Exception occurred\n#{e}"
ensure 
    db.close if db 
end 


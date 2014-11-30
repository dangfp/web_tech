require 'sqlite3'

@db = SQLite3::Database.new 'data/surfing.sqlite3'
statement = <<-STATEMENT
CREATE TABLE users(
  id integer primary key not null,
  name string not null,
  username string not null,
  password string not null
);
STATEMENT
@db.execute statement
require 'yaml'
require 'sqlite3'

data = File.open("data/journal_entries.yml", 'r') do |file|
  file.read
end
journal_entries = YAML.load(data)

@db = SQLite3::Database.new "data/surfing.sqlite3"
journal_entries.each do |entry|
  statement = "INSERT INTO journal_entries (title, content) VALUES (\"#{entry[:title]}\", \"#{entry[:content]}\")"
  @db.execute statement
end

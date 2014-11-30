require 'yaml'
require 'sqlite3'

data = File.open("data/journal_entries.yml", "r") { |file|  file.read  }
journal_entries = YAML.load(data)

@db = SQLite3::Database.new "data/surfing.sqlite3"

journal_entries.each do |entry|
  statement = "INSERT INTO journal_entries (id, title, content) VALUES (\"#{entry[:id]}\", \"#{entry[:title]}\", \"#{entry[:content]}\")"
  require 'pry'; binding.pry
  @db.execute statement
end
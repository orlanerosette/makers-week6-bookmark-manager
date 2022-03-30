require 'pg'

def set_up_test_database
  connection = PG.connect dbname: 'bookmark_manager_test'
  connection.exec "TRUNCATE bookmarks;"
end
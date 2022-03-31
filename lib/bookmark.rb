require 'pg'

class Bookmark
  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect dbname: 'bookmark_manager_test'
    else      
      connection = PG.connect dbname: 'bookmark_manager'
    end  
    bookmarks = connection.exec 'SELECT * FROM bookmarks;'
    bookmarks.map { |bookmark| bookmark['url'] }  
  end

  def self.create(new_url)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect dbname: 'bookmark_manager_test'
    else      
      connection = PG.connect dbname: 'bookmark_manager'
    end
    connection.exec "INSERT INTO bookmarks (url) VALUES ('#{new_url}');"
  end
end

require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect dbname: 'bookmark_manager_test'
    else      
      connection = PG.connect dbname: 'bookmark_manager'
    end  
    bookmarks = connection.exec 'SELECT * FROM bookmarks ORDER BY title ASC;' 
    bookmarks.map do |bookmark| 
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(url:, title:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect dbname: 'bookmark_manager_test'
    else      
      connection = PG.connect dbname: 'bookmark_manager'
    end
    bookmark = connection.exec "INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, title, url;"
    Bookmark.new(id: bookmark[0]['id'], title: bookmark[0]['title'], url: bookmark[0]['url'])
  end
end

require 'pg'

describe '.all' do
  it "returns list of bookmarks" do
    connection = PG.connect dbname: 'bookmark_manager_test'
    bookmark = Bookmark.create(url: 'https://www.aljazeera.com', title: 'Al-Jazeera')
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
    Bookmark.create(url: "http://www.google.com", title: "Google")
    bookmarks = Bookmark.all
    
    expect(bookmarks.length).to eq 3
    expect(bookmarks.first).to be_a Bookmark
    expect(bookmarks.first.id).to eq bookmark.id
    expect(bookmarks.first.title).to eq 'Al-Jazeera'
    expect(bookmarks.first.url).to eq 'https://www.aljazeera.com'
  end
end

describe '.create' do
  it "can create a bookmark object" do
    connection = PG.connect dbname: 'bookmark_manager_test'
    bookmark = Bookmark.create(url: 'https://gal-dem.com', title: 'gal-dem')
    persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

    expect(bookmark).to be_a Bookmark
    expect(bookmark.id).to eq persisted_data.first['id']
    expect(bookmark.title).to eq 'gal-dem'
    expect(bookmark.url).to eq 'https://gal-dem.com'
  end
end

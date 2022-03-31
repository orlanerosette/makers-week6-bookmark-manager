require 'pg'

feature 'viewing bookmarks' do
  scenario 'user can see bookmarks' do
    connection = PG.connect dbname: 'bookmark_manager_test'
    Bookmark.create('http://www.makersacademy.com/')
    Bookmark.create('http://www.destroyallsoftware.com')
    Bookmark.create('http://www.google.com/')
    visit '/'
    click_on 'Bookmarks'
    expect(page).to have_content 'http://www.makersacademy.com/'
    expect(page).to have_content 'http://www.google.com/'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
  end
end

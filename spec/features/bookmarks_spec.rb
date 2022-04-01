require 'pg'

feature 'viewing bookmarks' do
  scenario 'user can see and click on bookmarks' do
    connection = PG.connect dbname: 'bookmark_manager_test'
    Bookmark.create(url: 'http://www.makersacademy.com/', title: 'Makers Academy')
    Bookmark.create(url: 'http://www.miro.com/', title: 'Miro')
    Bookmark.create(url: 'http://www.google.com/', title: 'Google')
    

    visit '/'
    click_on 'Bookmarks'
    
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com/')
    expect(page).to have_link('Miro', href: 'http://www.miro.com/')
    expect(page).to have_link('Google', href: 'http://www.google.com/')
  end
end

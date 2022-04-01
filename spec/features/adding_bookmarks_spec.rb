require 'pg'

feature 'adding bookmarks' do
  scenario 'user can add bookmarks' do
    # connection = PG.connect dbname: 'bookmark_manager_test'
    # Bookmark.create

    visit '/'
    click_on 'Add new bookmark'
    fill_in 'title', with: 'gal-dem'
    fill_in 'url', with: 'https://gal-dem.com'
    click_on 'Add'

    expect(page).to have_link('gal-dem', href: 'https://gal-dem.com')
    
  end

  scenario "adds bookmark to database" do
    Bookmark.create(url:'https://gal-dem.com', title: 'gal-dem')
    bookmarks = Bookmark.all
    expect(bookmarks.first.url).to eq 'https://gal-dem.com'
    expect(bookmarks.first.title).to eq 'gal-dem'
  end
end

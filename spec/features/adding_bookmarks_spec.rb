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

    expect(page).to have_content "https://gal-dem.com"
  end

  scenario "adds bookmark to database" do
    Bookmark.create('https://gal-dem.com')
    expect(Bookmark.all).to include 'https://gal-dem.com'
  end
end

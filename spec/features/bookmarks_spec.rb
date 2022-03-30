feature 'viewing bookmarks' do
  scenario 'visiting bookmarks page' do
    visit '/'
    click_on 'Bookmarks'
    expect(page).to have_content 'http://www.makersacademy.com/'
    expect(page).to have_content 'http://www.google.com/'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
  end
end

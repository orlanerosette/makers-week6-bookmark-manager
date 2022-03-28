feature 'viewing bookmarks' do
  scenario 'visiting bookmarks page' do
    visit '/'
    click_on 'Bookmarks'
    expect(page).to have_content('https://makers.tech')
    expect(page).to have_content('https://github.com')
    expect(page).to have_content('https://ruby-doc.org')
  end
end

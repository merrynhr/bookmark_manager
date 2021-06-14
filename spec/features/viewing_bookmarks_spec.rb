feature "Viewing the bookmarks" do
  scenario 'The user can see the bookmarks' do
    visit('/bookmarks') #the page visited


    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com" 
  end
end
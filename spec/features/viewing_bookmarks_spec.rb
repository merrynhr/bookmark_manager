feature "Viewing bookmark" do
  scenario 'visit the home page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager" 
  end
end
feature 'Viewing bookmarks' do 
  feature 'visiting the homepage' do
     scenario 'the page title is visible' do
       visit '/'
       expect(page).to have_content 'Bookmark Manager'  
     end  
  end


feature "Viewing the bookmarks" do
  scenario 'The user can see the bookmarks' do
    
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    # connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    # connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    # connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")


    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
    Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'DAS')
    Bookmark.create(url: 'http://www.google.com', title: 'Google')


    visit('/bookmarks') 


    expect(page).to have_link('Makers', href: "http://www.makersacademy.com")
    expect(page).to have_link('DAS', href: "http://www.destroyallsoftware.com")
    expect(page).to have_link('Google', href: "http://www.google.com") 
  end
end
end
require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
   it 'returns all bookmarks' do

    connection = PG.connect(dbname: 'bookmark_manager_test')

    # # Add the test data
    # connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    # connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    # connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: "DAS")
    Bookmark.create(url: "http://www.google.com", title: "Google")


    bookmarks = Bookmark.all 

    expect(bookmarks.length).to eq 3
    expect(bookmarks.first).to be_a Bookmark
    expect(bookmarks.first.id).to eq bookmark.id
    expect(bookmarks.first.title).to eq 'Makers'
    expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'

    # expect(bookmarks).to include("http://www.makersacademy.com")
    # expect(bookmarks).to include("http://www.destroyallsoftware.com")
    # expect(bookmarks).to include("http://www.google.com")
   end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      # persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")
      persisted_data = persisted_data(id: bookmark.id)
  
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
      expect(bookmark.title).to eq 'Test Bookmark'
    end
  end


end

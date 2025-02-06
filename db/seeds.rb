# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb



# Clear existing records
UserClub.destroy_all
List.destroy_all
User.destroy_all
Club.destroy_all
Meeting.destroy_all
puts "Users, Lists, Clubs, and Meetings destroyed"

# Create Users
users = User.create([
  { email: 'adelina@example.com', password: 'password', name: 'Adelina' },
  { email: 'lisa@example.com', password: 'password', name: 'Lisa' },
  { email: 'ioana@example.com', password: 'password', name: 'Ioana' },
  { email: 'anna@example.com', password: 'password', name: 'Anna' },
  { email: 'xiao@example.com', password: 'password', name: 'Xiao' }
])
puts 'Users created'

# CLUB
club = Club.create(name: 'The Book Club', created_date: DateTime.now)

# Add Users to Club
users.each do |user|
  UserClub.create(user: user, club: club)
end
puts 'Club created'

# Fetch books from Google Books API
book_3_data = GoogleBooksService.search_books("White Nights").first
book_2_data = GoogleBooksService.search_books("The Seven Husbands of Evelyn Hugo").first
book_1_data = GoogleBooksService.search_books("A Little Life").first

# Ensure the books have been fetched correctly before proceeding
if book_1_data && book_2_data && book_3_data
  # Create Book records using symbol-based keys
  book_1_record = Book.create(
    title: book_1_data[:title], # Use the symbol-based key
    authors: book_1_data[:authors], # Joining authors if it's an array
    cover_url: book_1_data[:cover_url],
    overview: book_1_data[:overview],
    google_id: book_1_data[:google_id]
  )

  book_2_record = Book.create(
    title: book_2_data[:title],
    authors: book_2_data[:authors],
    cover_url: book_2_data[:cover_url],
    overview: book_2_data[:overview],
    google_id: book_2_data[:google_id]
  )

  book_3_record = Book.create(
    title: book_3_data[:title],
    authors: book_3_data[:authors],
    cover_url: book_3_data[:cover_url],
    overview: book_3_data[:overview],
    google_id: book_3_data[:google_id]
  )
  puts 'Books created'
else
  puts 'Error: Failed to fetch book data'
end

# Create Meetings with Book Data
meeting_4 = Meeting.create(
  book: book_3_record,
  club: club,
  location: 'The Institute Bar',
  date: DateTime.new(2024, 7, 24),
  status: 'Scheduled'
)

meeting_3 = Meeting.create(
  book: book_2_record,
  club: club,
  location: 'Nenno',
  date: DateTime.new(2024, 5, 3),
  status: 'Scheduled'
)

meeting_2 = Meeting.create(
  book: book_1_record,
  club: club,
  location: 'Brewdog Waterloo',
  date: DateTime.new(2024, 1, 19),
  status: 'Scheduled'
)

meeting_1 = Meeting.create(
  book: book_1_record,
  club: club,
  location: 'The Institute Bar',
  date: DateTime.new(2023, 10, 25),
  status: 'Scheduled'
)

puts 'Meetings created'

# Create Lists for each user
users.each do |user|
  user.lists.create(name: 'TBR')
  user.lists.create(name: 'Currently Reading')
  user.lists.create(name: 'Read')
end

puts 'Lists created'


# Create Progresses
# users.each do |user|
#   Progress.create(
#     user: user,
#     book: book_1,
#     club: club,
#     progress_date: DateTime.now,
#     status: 'Reading'
#   )
#   Progress.create(
#     user: user,
#     book: book_2,
#     club: club,
#     progress_date: DateTime.now,
#     status: 'Reading'
#   )
# end

# Create Reviews (Example)
# Review.create(user: users.first, book: book_1, comment: 'An incredibly moving book, deeply emotional!', rating: 5)
# Review.create(user: users.second, book: book_2, comment: 'A fascinating exploration of love and loss.', rating: 4)

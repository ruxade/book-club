# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Create Users
users = User.create([
  { email: 'adelina@example.com', password: 'password' },
  { email: 'lisa@example.com', password: 'password' },
  { email: 'ioana@example.com', password: 'password' },
  { email: 'anna@example.com', password: 'password' },
  { email: 'xiao@example.com', password: 'password' }
])
puts 'users created'

# Create Books
book_1 = Book.create(title: 'A Little Life',
cover_url: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1446469353i/22822858.jpg',
 overview: 'An emotional novel about friendship and trauma.')
book_2 = Book.create(title: 'The Seven Husbands of Evelyn Hugo',
 cover_url: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1556639327i/45416596.jpg',
  overview: 'A glamorous, tragic tale of a Hollywood star and her seven marriages.')

# Create a Club
club = Club.create(name: 'The Book Club', created_date: DateTime.now)

# Add Users to Club
users.each do |user|
  UserClub.create(user: user, club: club)
end

puts 'club created'

# Create Meetings
meeting_1 = Meeting.create(
  book: book_1,
  club: club,
  location: 'Room 101',
  date: DateTime.now + 7.days,
  status: 'Scheduled'
)

meeting_2 = Meeting.create(
  book: book_2,
  club: club,
  location: 'Room 102',
  date: DateTime.now + 14.days,
  status: 'Scheduled'
)

puts 'meetings created'
# Create Progresses (Example)
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

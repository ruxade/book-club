require 'net/http'
require 'json'

class GoogleBooksService
  BASE_URL = "https://www.googleapis.com/books/v1/volumes?q="

  def self.search_books(query)
    api_key = ENV["GOOGLE_BOOKS_API_KEY"]
    url = URI("#{BASE_URL}#{URI.encode_www_form_component(query)}&key=#{api_key}")

    response = Net::HTTP.get(url)
    books_data = JSON.parse(response)

    books_data["items"]&.map do |item|
      volume_info = item["volumeInfo"]

      {
        title: volume_info["title"],
        authors: volume_info["authors"]&.join(", ") || "Unknown Author",
        publication_year: volume_info["publishedDate"]&.split("-")&.first || "Unknown Year",
        cover_url: volume_info.dig("imageLinks", "thumbnail"),
        overview: volume_info["description"] || "No description available.",
        page_count: volume_info["pageCount"] || "Unknown pages",
        categories: volume_info["categories"]&.join(", ") || "No categories",
        average_rating: volume_info["averageRating"] || "No rating",
        google_id: item["id"]
      }
    end || []
  end
end


require 'open-uri'
puts 'Destroying movies'
Movie.destroy_all
# List.destroy_all

url = 'http://tmdb.lewagon.com/movie/top_rated'
response = JSON.parse(URI.open(url).read)

response['results'].each do |movie_hash|
  Movie.create!(
    poster_url: "https://image.tmdb.org/t/p/w500#{movie_hash['poster_path']}",
    title: movie_hash['title'],
    overview: movie_hash['overview'],
    rating: movie_hash['vote_average']
  )
end
puts 'Created movies!'

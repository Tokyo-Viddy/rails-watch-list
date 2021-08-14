
require 'open-uri'
puts 'Destroying movies'
Movie.destroy_all
# List.destroy_all

url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=3ff6f730defa2300b01e17dd2ace8608&language=en-US&page=1'

# 'https://api.themoviedb.org/3/movie/550?api_key=3ff6f730defa2300b01e17dd2ace8608'
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

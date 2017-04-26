require 'rest-client'
require 'json'
require 'pry'


#binding.pry
def get_all_characters
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  all_character_array = JSON.parse(all_characters)["results"]
end

def get_character_films(character)
  all_character_array = get_all_characters
  this_character_hash = all_character_array.find {|character_hash| character_hash["name"].downcase == character}
  film_array = this_character_hash["films"]
end

def get_character_movies_from_api(character)
  #make the web request

  film_array = get_character_films(character)
  film_info_array = film_array.collect {|film_url| JSON.parse(RestClient.get(film_url))}





  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each {|film| puts film["title"]}
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

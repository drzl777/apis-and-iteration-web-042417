require 'rest-client'
require 'json'
require 'pry'


#binding.pry
def get_all_characters
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  all_character_array = JSON.parse(all_characters)["results"]
end

def get_character_hash(character)
  all_character_array = get_all_characters
  this_character_hash = all_character_array.find {|character_hash| character_hash["name"].downcase == character} :
end



def parse_character_movies(array_of_film_hashes)
  # some iteration magic and puts out the movies in a nice list
  array_of_film_hashes.each {|film| puts film.title}
end


def show_character_movies(character) #change to pass character Object
  character_object = Character.new(get_character_hash(character))

  parse_character_movies(character_object.movies)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

class Character
  def initialize(character_hash)
    @character_info = character_hash
  end

  def name
    @character_info["name"]
  end

  def movies
    film_urls = @character_info["films"]
    film_urls.collect {|film_url| Movie.new(film_url)}
  end

end

class Movie

  def initialize(film_url)
    @film_hash = JSON.parse(RestClient.get(film_url))
  end

  def title
    @film_hash["title"]
  end
end

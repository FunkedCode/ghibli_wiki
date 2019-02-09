# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
require 'net/http'
require 'json'
require 'pp'

# Resistance is useless!
TopMovie.destroy_all
Character.destroy_all
CharacterType.destroy_all
Location.destroy_all
Film.destroy_all


uri = URI('https://ghibliapi.herokuapp.com/films')
raw_json = Net::HTTP.get(uri)
film_json = JSON.parse(raw_json)

film_json.each do |film|
  new_film = Film.create(title:  film['title'],
                         description:  film['description'],
                         director:  film['director'],
                         producer:  film['producer'],
                         release_date:  film['release_date'],
                         rt_score:  film['rt_score'])
  if new_film.errors.count > 0
    pp new_film.errors
  end
end


# Grab Ghibli Characters
uri = URI('https://ghibliapi.herokuapp.com/people')
raw_json = Net::HTTP.get(uri)
character_json = JSON.parse(raw_json)

character_json.each do |character|

  # Find the film the character belongs to
  characters_film = JSON.parse(Net::HTTP.get(URI(character['films'][0])))

  new_film = Film.find_or_create_by(title: characters_film['title']) do |film|
    film.title = characters_film['title']
    film.description = characters_film['description']
    film.director = characters_film['director']
    film.producer = characters_film['producer']
    film.release_date = characters_film['release_date']
    film.rt_score = characters_film['rt_score']
  end

  if new_film.errors.count > 0
    pp new_film.errors
  end

  # Grab the character type
  character_type_json = JSON.parse(Net::HTTP.get(URI(character['species'])))

  new_character_type = CharacterType.find_or_create_by(name: character_type_json['name']) do |character_type|
    character_type.classification = character_type_json['classification']
    character_type.eye_colors = character_type_json['eye_colors']
    character_type.hair_colors = character_type_json['hair_colors']
  end

  if new_character_type.errors.count > 0
    pp new_character_type.errors
  end

  # Create the character through film
  new_character = new_film.characters.new(name: character['name'],
                                          gender: character['gender'],
                                          age: character['age'],
                                          eye_color: character['eye_color'],
                                          hair_color: character['hair_color'])

  # Add a character association
  new_character.character_type = new_character_type

  new_character.save

  if new_character.errors.count > 0
    pp new_character.errors
  end
end

# Grab movie locations
uri = URI('https://ghibliapi.herokuapp.com/locations')
raw_json = Net::HTTP.get(uri)
location_json = JSON.parse(raw_json)

location_json.each do |location|
  new_location = Location.new(name: location['name'],
                              climate: location['climate'],
                              terrain: location['terrain'],
                              surface_water: location['surface_water'].to_i)

  # Grab film and attach its location
  film_json = JSON.parse(Net::HTTP.get(URI(location['films'][0])))
  new_location.film = Film.find_by_title(film_json['title'])
  new_location.save

  if new_location.errors.count > 0
    pp new_location.errors
  end
end

#Top movies from MAL
page_number = 0

until page_number >= 3
  page_number += 1
  uri = URI("https://api.jikan.moe/v3/top/anime/#{page_number}/movie")
  raw_json = Net::HTTP.get(uri)
  top_movie_json = JSON.parse(raw_json)

  top_movie_json['top'].each do |top_movie|
    top_movie = TopMovie.create(title: top_movie['title'],
                                rank: top_movie['rank'],
                                mal_url: top_movie['url'],
                                mal_score: top_movie['score'],
                                image_url: top_movie['image_url'])
    if top_movie.errors.count > 0
      pp top_movie.errors
    end
  end
end


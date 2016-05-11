require_relative 'lat_long_finder'

def open_osm_on(latitude, longitude)
  osm_url  = "http://www.openstreetmap.org"
  full_url = "#{osm_url}/?mlat=#{latitude}&mlon=#{longitude}#map=15/#{latitude}/#{longitude}&layers=Q"
  Launchy.open(full_url)
end

full_input = clean_input(ARGV.join(' '))

puts "Trying to extract valid lat long from '#{full_input}'"
lat, long = extract_lat_long(full_input)

puts "Latitude and longitude found (#{lat}, #{long}), opening OpenStreetMaps in a new browser tab"
open_osm_on(lat, long)

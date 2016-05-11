require 'launchy'

# TODO make it configurable through a file
LAT_RANGE  =  30..60
LONG_RANGE = -30.0..30.0

def clean_args(argv)
   argv.join(" ").gsub(",", ".").downcase
end

def extract_lat_long(input)
  coords = input.scan(/-?\d{1,2}\.\d+/i).map(&:to_f)

  raise ArgumentError, "Found #{coords.size} coordinates, expected 2" if coords.size != 2

  if LAT_RANGE === coords[0] && LONG_RANGE === coords[1]
    [coords[0], coords[1]]
  elsif LONG_RANGE === coords[0] && LAT_RANGE === coords[1]
    [coords[1], coords[0]]
  else
    raise ArgumentError, "Found coordinates #{coords} not in range (latitude: #{LAT_RANGE}, longitude: #{LONG_RANGE})"
  end
end

def open_osm_on(latitude, longitude)
  osm_url  = "http://www.openstreetmap.org"
  full_url = "#{osm_url}/?mlat=#{latitude}&mlon=#{longitude}#map=15/#{latitude}/#{longitude}&layers=Q"
  Launchy.open(full_url)
end

full_input = clean_args(ARGV)

puts "Trying to extract valid lat long from '#{full_input}'"
lat, long = extract_lat_long(full_input)

puts "Latitude and longitude found (#{lat}, #{long}), opening OpenStreetMaps in a new browser tab"
open_osm_on(lat, long)

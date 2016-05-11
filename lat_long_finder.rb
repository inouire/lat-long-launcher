require 'launchy'

# TODO make it configurable through a file
LAT_RANGE  =  30..60
LONG_RANGE = -30.0..30.0

def clean_input(input)
   input.gsub(",", ".").downcase
end

def extract_lat_long(raw_input)
  input = clean_input(raw_input)

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

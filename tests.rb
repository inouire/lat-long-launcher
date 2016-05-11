require_relative 'lat_long_finder'

print "Testing the lat long extractor on some samples"

SAMPLES = {
  [50.83653, 4.33904] => [
    'Lat: 50,83653 Long: 4,33904',
    'foo 50.83653/4,33904 bar',
    '4.33904 -- 50.83653'
  ]
}

def assert_extracted(input, expected)
  begin
    lat, long = extract_lat_long(input)
    if lat != expected[0] || long != expected[1]
      puts "Bad lat long extraction, expecting #{expected}, got [#{lat}, #{long}]"
    end
  rescue Exception => e
    puts "Error while extracting lat long from #{input}: #{e.message}"
    exit(1)
  end
end

SAMPLES.each do |expected, inputs|
  inputs.each do |input|
    assert_extracted(input, expected)
    print '.'
  end
end

puts "Done"
exit(0)
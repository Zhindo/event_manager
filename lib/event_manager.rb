require 'csv'

puts 'Event Manager Initialized!'

contents = CSV.open('event_attendees.csv', 
    headers: true,
    header_converters: :symbol
)

contents.each do |row|
    name = row[:first_name]
    zipcode = row[:zipcode]

    # If the zip code is exactly five digits, assume that it is ok

    # If the zip code is more than five digits, truncate it to the first five digits

    # If the zip code is less than five digits, add zeros to the front until it becomes five digits




    puts "#{name} #{zipcode}"
end


# lines = File.readlines('event_attendees.csv')

# lines.each_with_index do |line, index|
#     next if index == 0
#     columns = line.split(',')
#     first_name = columns[2]
#     puts first_name
# end
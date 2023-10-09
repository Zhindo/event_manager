require 'csv'

def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, '0')[0..4]
end


puts 'Event Manager Initialized!'

contents = CSV.open('event_attendees.csv', 
    headers: true,
    header_converters: :symbol
)

contents.each do |row|
    name = row[:first_name]
    zipcode = row[:zipcode]

    zipcode = clean_zipcode(row[:zipcode])


    puts "#{name} #{zipcode}"
end


# lines = File.readlines('event_attendees.csv')

# lines.each_with_index do |line, index|
#     next if index == 0
#     columns = line.split(',')
#     first_name = columns[2]
#     puts first_name
# end
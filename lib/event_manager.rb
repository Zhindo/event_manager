require 'csv'

require 'google/apis/civicinfo_v2'

require 'erb'

require 'time'


def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, '0')[0..4]
end

def legislators_by_zipcode(zip)

    civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
    civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'


    begin
        civic_info.representative_info_by_address(
        address: zip,
        levels: 'country', 
        roles: ['legislatorUpperBody', 'legislatorLowerBody']
        ).officials
    rescue
        'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
    end

end

def save_thank_you_letter(id, form_letter)
    
    Dir.mkdir('output') unless Dir.exist?('output')

    filename = "output/thanks#{id}.html"

    File.open(filename, 'w') do |file|
        file.puts form_letter
    end

end

def clean_phone_numbers(number)

    number.gsub!("(", "")
    number.gsub!(")", "") 
    number.gsub!("-", "")
    number.gsub!(".", "")
    number.gsub!(" ", "")
    
    if number.length == 10
        number
    elsif number.length < 10
        number = '0000000000'
    elsif number.length == 11 && number[0] == '1'
        number.slice!(0)
        number
    elsif number.length == 11 && number[0] != '1'
        number = '0000000000'
    else
        number = '0000000000'
    end

end

def peak_hours(number)

end

puts 'Event Manager Initialized!'

contents = CSV.open('event_attendees.csv', 
    headers: true,
    header_converters: :symbol
)

template_letter = File.read('form_letter.erb')

erb_template = ERB.new template_letter


contents.each do |row|

    id = row[0]

    name = row[:first_name]
    
    number = row[:homephone]

    number = clean_phone_numbers(number)

    date = row[:regdate]

    puts date
end


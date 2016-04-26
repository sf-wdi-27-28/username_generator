# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

def format_name(first, last)
  return nil if first.empty? || last.empty?
  first_name = first.gsub(/[^a-z]/i, "")
  last_name = last.gsub(/[^a-z]/i, "")
  (first_name[0] << last_name).downcase
end

def format_year year
  year = year.to_s
  if year.length == 4
    year[2,2]
  end
end

def build_username (first_name, last_name, year)
  "#{format_name(first_name,last_name)}#{format_year(year)}"
end

def check_privilege arg=0
  arg = arg.floor
  if arg == 0
    return "user"
  elsif arg == 1
    return "seller"
  elsif arg == 2
    return "manager"
  elsif arg >= 3
    return "admin"
  end
end

def generate_username arg

end

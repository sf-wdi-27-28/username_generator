# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

def format_name(first, last)
  username = first[0]
  username << last
  username.downcase

  # end
end
format_name(" j a c k i e "," f a m b r o u g h ")

def format_year year
  year = year.to_s
  if year.length == 4
    year[-2,2]
  end
end

def build_username (first_name, last_name, year)
  "#{format_name(first_name,last_name)}#{format_year(year)}"
end

def check_privilege (number = 0)
  if number == 0
  "user"
  elsif number == 1
  "seller"
  elsif number == 2
  "manager"
  else
  "admin"
  end
end

def user_type_prefix (level)
  if level == 0
  "user-"
  elsif level == 1
  "seller-"
  elsif level == 2
  "manager-"
  else
  "admin-"
  end
end

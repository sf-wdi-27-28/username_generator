# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

def format_name(first, last)
  f = first.delete(" ")
  l = last.delete(" ")
  username = f[0]
  username << l
  username.downcase


  # end
end
format_name(" j a c k i e "," f a m b r o u g h ")

def format_year (year)
  year = year.to_s
  if year.length == 4
    year[-2,2]
  end
end

def build_username (first_name, last_name, year, privilege_level=0)
  "#{user_type_prefix(privilege_level)}#{format_name(first_name,last_name)}#{format_year(year)}"
end


def check_privilege (num = 0)
  number = num.floor
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
  ""
  elsif level == 1
  "seller-"
  elsif level == 2
  "manager-"
  else
  "admin-"
  end
end

def generate_username (first_name, last_name, birth_year, privilege_level)
  unique_username = first_name << last_name << birth_year << privilege_level
  unique_username
end

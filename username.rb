# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

def format_name(first, last)
  username = first[0]
  username<<last
  username.downcase
end

def format_year(year)
  year = year.to_s
  if year.length == 4
    year[2,2]
  end
end

def build_username(first_name, last_name, year, privilege_level)
  "#{user_type_prefix(privilege_level)}#{format_name(first_name,last_name)}#{format_year(year)}"
end

def check_privilege(num = 0)
  if num == 0
    "user"
  elsif num == 1
    "seller"
  elsif num == 2
    "manager"
  else
    "admin"
  end
end

def user_type_prefix(level)
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

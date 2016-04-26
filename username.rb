# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

def format_name(first, last)
  return nil if first.empty? || last.empty?
  f = first.delete(" ")
  l = last.delete(" ")
  username = f[0]
  username << l
  username.downcase
end


def format_year (year)
  year = year.to_s
  if year.length == 4
    year[-2,2]
  end
end

def build_username (first_name, last_name, year, privilege_level=0)
name = format_name(first_name,last_name)
return nil if name.nil?
  "#{user_type_prefix(privilege_level)}#{name}#{format_year(year)}"

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
  username = build_username(first_name, last_name, birth_year, privilege_level)
  $user_counts = {}
  if $user_counts[username].nil?
    $user_counts[username] = 0
  else
    $user_counts[username] +=1
    user_count = $user_counts[username].to_string
    username + "_" + user_count
  end
end

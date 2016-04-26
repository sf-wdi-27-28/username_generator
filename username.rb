# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

def format_name(first, last)
  return nil if last.empty? || first.empty?
  first = first.gsub(/[^A-Za-z]/, '')
  last = last.gsub(/[^A-Za-z]/, '')
  (first[0] + last).downcase
end

def format_year(year)
  year = year.to_s
  if year.length == 4
    year[-2,2]
  end
end

def check_privilege(type = 0)
  user_types = ["user", "seller" ,"manager", "admin"]
  type = 3 if type > 3
  user_types[type]
end

def user_type_prefix(level)
  prefix = check_privilege(level)
  unless prefix == "user" then prefix << "-" else "" end
end


def build_username(first_name, last_name, year, privilege_level = 0)
  "#{user_type_prefix(privilege_level)}#{format_name(first_name,last_name)}#{format_year(year)}"
end

$users = {}

def generate_username(first, last, year, level = 0)
  name = build_username(first, last, year, level)
  if $users[name].nil?
    $users[name] = name
    name
  else
    $users[name] =+ 1
    user_count = $users[name].to_s
    name << "_" << user_count
  end
end

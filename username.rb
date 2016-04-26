# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

def format_name(first, last)
  first = first.gsub(/[^a-z]/i, '')
  last = last.gsub(/[^a-z]/i, '')
  return nil if first.empty? || last.empty?
  (first[0] << last).downcase
end

def format_year(year)
  year_str = year.to_s
  return nil if year_str.length != 4
  year_str[2,2]
end

def check_privilege(type = 0)
  user_types = ["user", "seller", "manager", "admin"]
  type = 3 if type > 3
  user_types[type]
end

def user_type_prefix(type)
  prefix = check_privilege(type)
  unless prefix == "user" then prefix << "-" else "" end
end

def build_username(first, last, year, type = 0)
  user_type_prefix(type) << format_name(first, last) << format_year(year)
end

$users = {}
def generate_username(first, last, year, type = 0)
  name = build_username(first, last, year, type)
  if $users[name].nil?
    $users[name] = 0
  else $users[name] += 1
    user_count = $users[name].to_sname << "_" << user_count
  end
end

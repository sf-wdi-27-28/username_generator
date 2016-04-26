# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

def format_name(first, last)
  return nil if first.empty? || last.empty?
  first_name = first.gsub(/[^a-z]/i, "")
  last_name = last.gsub(/[^a-z]/i, "")
  (first_name[0] << last_name).downcase
  #((first.split(" ").join[0] + last.split(" ").join).downcase).gsub(/\d|\W|_[^a-z]/, "")
end

def format_year(year)
  year_string = year.to_s
  return nil if year_string.length !=4
  year_string[2,2]
end

def check_privilege(type = 0)
  user_types = ["user", "seller", "manager", "admin"]
  type = 3 if type > 3
  user_types[type]
end

def user_type_prefix(lvl)
  prefix = check_privilege(lvl)
  unless prefix == "user" then prefix << "-" else "" end
end

def build_username(first, last, year, lvl=0)
  user_type_prefix(lvl) << format_name(first,last) << format_year(year)
  # prefix = user_type_prefix(lvl)
  # name = format_name(first, last)
  # this_year = format_year(year)
  # prefix << name << this_year
end

$users = {}

def generate_username(fist, last, year, lvl=0)
  name = build_username(first, last, year, lvl)
  if $users[name].nil?
      $users[name] = 0
      name
  else
    $users[name] += 1
    user_count = $users[name].to_s
    name << "-" << user_count
  end
end

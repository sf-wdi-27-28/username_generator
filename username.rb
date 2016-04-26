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
  user_types = ["user","seller","manager","admin"]
  arg = 3 if arg > 3
  user_types[arg]
end

def user_type_prefix arg
  prefix = check_privilege(arg)
  unless prefix == "user" then prefix << "-" else "" end
end

def build_username (first, last, year, arg=0)
  name = format_name(first, last)
  return nil if name.nil?
  yy = format_year(year)
  return nil if yy.nil?

  user_type_prefix(arg) + name + yy
end

$user_counts = {}

def generate_username (first, last, year, arg=0)
  username = build_username(first, last, year, arg)

  if $user_counts[username].nil?
    $user_counts[username] = 0;
    username
  else
    $user_counts[username] +=1
    user_count = $user_counts[username].to_s
    username + "_" + user_count
  end
end

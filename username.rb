# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

$user_names = {}

def format_name(first, last)
  first = first.downcase.gsub(/[^a-z]/,"")
  last = last.downcase.gsub(/[^a-z]/,"")
  if (first != "" && last != "") then (first[0] + last) else return nil end
end

def format_year(year)
  year.to_s.length === 4? year.to_s.slice(2,4) : nil
end

def build_username(first_name,last_name,birth_year,privilege_level = 0)
  user_type_prefix(privilege_level) + format_name(first_name,last_name) + format_year(birth_year)
end

def check_privilege(level = 0)
  hash = {
    "user" => 0,
    "seller" => 1,
    "manager" => 2,
    "admin" => 3,
  }
  level > 3 ? level = 3 : level = level.floor
  hash.each_key{ |key| if hash[key] === level then return key end }
end

def user_type_prefix(level)
  level >= 1 ? check_privilege(level) + "-" : ""
end

def generate_username(first_name, last_name, birth_year, privilege_level = 0)
  new_username = build_username(first_name, last_name, birth_year, privilege_level)
  if $user_names.include?(new_username)
    $user_names[new_username] += 1
    new_username = new_username + "_" + $user_names[new_username].to_s
  else
    $user_names[new_username] = 0
  end
  new_username
end

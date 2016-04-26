# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

def format_name(first, last)
  first = first.downcase
  last = last.downcase
  first[0]+last
end

def format_year(year)
  year = year.to_s
  if year.length == 4
    year[2,2]
  end
end

def build_username(first_name, last_name, birth_year)
  first_name[0]+last_name+birth_year.to_s[2,2]
end

def check_privilege (level=0)
  user_privilege = ["user", "seller", "manager", "admin"]
  user_privilege[level]
  if level >= 3
    user_privilege.last
  elsif level.floor
    user_privilege[level]
  elsif level == 0
    user_privilege[0]
  end
end

def user_type_prefix (level="")
  level >= 1 ? check_privilege(level) + "-" : ""
end

def build_username(first, last, year, level=0)
  name = format_name(first, last)
  return nil if name.nil?

  yy = format_year(year)
  return nil if yy.nil?

  user_type_prefix(level) + name + yy
end

# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

def format_name(first, last)
  if first.length == 0 || last.length == 0
    nil
  else
  first.gsub!(/[\W\d]/, "")
  last.gsub!(/[\W\d]/, "")
  user = first[0].downcase << last.downcase
  return user
  end
end

def format_year (year)
  year = year.to_s
  if  year.length == 4
      year[2..3]
  end
end

# Felt lost in this challange of section 2, breakdown of function construction
def build_username(first, last, year, level=0)
  name = format_name(first, last) #name equals format name inputs
  return nil if name.nil? # if name has no input return nil

  yy = format_year(year) # pulled from format_year function
  return nil if yy.nil? # if year has no input it will return nil
  # combine user_type_prefix function with name & year variable to build username
  user_type_prefix(level) + name + yy
end

def check_privilege level=0
  taco = ["user", "seller", "manager", "admin"]
  if level >= 3
    taco.last
  else
    taco[level]
  end
end

# using teneray to check if user type is greater than one
# argument ? true : false
# As argument is true, true gets returned
def user_type_prefix level
  level >= 1 ? check_privilege(level) + "-" : ""
end

$users = {} # use $ peso to link globa veriables
def generate_username (first_name, last_name, birth_year, privilege_level=0)
username = build_username(first_name, last_name, birth_year, privilege_level)
  if $users[username].nil?
     $users[username] = 0
     username
  else
     $users[username] += 1
     count_user = $users[username].to_s
     username + "_" + count_user
  end
end

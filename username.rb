# Make sure to run the tests in your /spec folder
# Run `rspec spec/username_spec.rb` to get started.

def format_name(first, last)
   if first.empty? || last.empty?
      return nil
   end
   first.split(' ').join.downcase[0] + last.split(' ').join.downcase
end


def format_year(birth_date)
  year = birth_date.to_s
  if year.length == 4
     year[-2,2]
  end
end


$user_types = ["user", "seller", "manager", "admin"]

def check_privilege(type=0)
  if type >= 0
    $user_types[type] || $user_types.last
  else
    $user_types.first
  end
end

def user_type_prefix(level)
  level >= 1 ? check_privilege(level) + "-" : ""
end

def build_username(first, last, year, level=0)
  name = format_name(first, last)
  return nil if name.nil?

  yy = format_year(year)
  return nil if yy.nil?

  user_type_prefix(level) + name + yy
end

$user_counts = {} # Hash of usernames, temporary storage
# Key: username string. (Keys are always unique).
# Value: username count.

def generate_username(first, last, year, level=0)
  username = build_username(first, last, year, level)

  if $user_counts[username].nil?
    $user_counts[username] = 0; # initialize count at zero
    username
  else
    $user_counts[username] +=1 # increment username count
    user_count = $user_counts[username].to_s
    username + "_" + user_count
  end
end
